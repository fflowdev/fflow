import 'dart:async';
import 'dart:io';

import 'package:fflow/core/ffmpeg/ffmpeg_process_controller.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_task.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ffmpeg_queue_manager.freezed.dart';

@freezed
abstract class FfmpegQueueState with _$FfmpegQueueState {
  const factory FfmpegQueueState({
    required int maxConcurrentTasks,
    @Default(<FfmpegTask>[]) List<FfmpegTask> tasks,
  }) = _FfmpegQueueState;

  const FfmpegQueueState._();

  int get activeTaskCount =>
      tasks.where((task) => task.status.reservesExecutionSlot).length;

  int get queuedTaskCount =>
      tasks.where((task) => task.status == FfmpegTaskStatus.queued).length;

  int get completedTaskCount =>
      tasks.where((task) => task.status == FfmpegTaskStatus.succeeded).length;

  int get failedTaskCount =>
      tasks.where((task) => task.status == FfmpegTaskStatus.failed).length;

  int get canceledTaskCount =>
      tasks.where((task) => task.status == FfmpegTaskStatus.canceled).length;

  FfmpegTask? taskById(String id) {
    for (final task in tasks) {
      if (task.id == id) {
        return task;
      }
    }
    return null;
  }
}

class FfmpegQueueManager {
  FfmpegQueueManager({
    FfmpegProcessControllerFactory? controllerFactory,
    DateTime Function()? clock,
    String Function()? idGenerator,
    int initialMaxConcurrentTasks = 1,
    bool? supportsPause,
  }) : _controllerFactory =
           controllerFactory ?? defaultFfmpegProcessControllerFactory,
       _clock = clock ?? DateTime.now,
       _idGenerator = idGenerator ?? _defaultTaskIdGenerator,
       _supportsPause = supportsPause ?? !Platform.isWindows,
       _state = FfmpegQueueState(
         maxConcurrentTasks: _validateMaxConcurrentTasks(
           initialMaxConcurrentTasks,
         ),
       );

  final FfmpegProcessControllerFactory _controllerFactory;
  final DateTime Function() _clock;
  final String Function() _idGenerator;
  final bool _supportsPause;
  final StreamController<FfmpegQueueState> _stateController =
      StreamController<FfmpegQueueState>.broadcast();
  final Map<String, _TaskRuntime> _runtimes = {};

  FfmpegQueueState _state;
  int _taskSequence = 0;
  bool _isDisposed = false;
  bool _isPumping = false;
  bool _needsPump = false;

  FfmpegQueueState get state => _state;

  Stream<FfmpegQueueState> get states => _stateController.stream;

  bool get supportsPause => _supportsPause;

  FfmpegTask enqueue(
    FfmpegCommand command, {
    String? id,
    String? label,
  }) {
    return enqueueRequest(
      FfmpegTaskRequest(
        id: id,
        label: label,
        command: command,
      ),
    );
  }

  FfmpegTask enqueueRequest(FfmpegTaskRequest request) {
    _assertNotDisposed();
    final now = _clock();
    final task = FfmpegTask(
      id: request.id ?? _nextGeneratedTaskId(),
      label: request.label,
      command: request.command,
      status: FfmpegTaskStatus.queued,
      createdAt: now,
      queuedAt: now,
      attempt: 1,
      supportsPause: _supportsPause,
    );
    _ensureTaskDoesNotExist(task.id);
    _setState(_state.copyWith(tasks: [..._state.tasks, task]));
    _schedulePump();
    return task;
  }

  List<FfmpegTask> enqueueAll(Iterable<FfmpegTaskRequest> requests) {
    final tasks = <FfmpegTask>[];
    for (final request in requests) {
      tasks.add(enqueueRequest(request));
    }
    return tasks;
  }

  FfmpegTask startTask(String id) {
    _assertNotDisposed();
    final task = _requireTask(id);
    if (!task.canStart || task.status == FfmpegTaskStatus.queued) {
      _schedulePump();
      return task;
    }

    final now = _clock();
    final updated = task.copyWith(
      status: FfmpegTaskStatus.queued,
      queuedAt: now,
      startedAt: null,
      endedAt: null,
      progress: null,
      runResult: null,
      stopResult: null,
      lastStdoutLine: null,
      lastStderrLine: null,
      errorMessage: null,
      attempt: task.attempt + 1,
    );
    _replaceTask(updated);
    _schedulePump();
    return updated;
  }

  Future<FfmpegTask> pauseTask(String id) async {
    _assertNotDisposed();
    final runtime = _requireRuntime(id);
    final task = _requireTask(id);
    if (task.status != FfmpegTaskStatus.running) {
      throw StateError('Task $id is not running');
    }
    if (!runtime.controller.supportsPause) {
      throw UnsupportedError('Pausing FFmpeg is not supported');
    }

    runtime.controller.pause();
    final updated = task.copyWith(status: FfmpegTaskStatus.paused);
    _replaceTask(updated);
    return updated;
  }

  Future<FfmpegTask> resumeTask(String id) async {
    _assertNotDisposed();
    final runtime = _requireRuntime(id);
    final task = _requireTask(id);
    if (task.status != FfmpegTaskStatus.paused) {
      throw StateError('Task $id is not paused');
    }
    if (!runtime.controller.supportsPause) {
      throw UnsupportedError('Resuming FFmpeg is not supported');
    }

    runtime.controller.resume();
    final updated = task.copyWith(status: FfmpegTaskStatus.running);
    _replaceTask(updated);
    return updated;
  }

  Future<FfmpegStopResult> stopTask(
    String id, {
    bool force = false,
    Duration gracefulTimeout = const Duration(seconds: 5),
    Duration terminateTimeout = const Duration(seconds: 2),
    Duration killTimeout = const Duration(seconds: 1),
  }) async {
    _assertNotDisposed();
    final task = _requireTask(id);
    if (task.status == FfmpegTaskStatus.queued) {
      _replaceTask(
        task.copyWith(
          status: FfmpegTaskStatus.canceled,
          endedAt: _clock(),
          stopResult: FfmpegStopResult.notRunning,
        ),
      );
      _schedulePump();
      return FfmpegStopResult.notRunning;
    }

    final runtime = _runtimes[id];
    if (runtime == null) {
      return FfmpegStopResult.notRunning;
    }

    final previousStatus = task.status;
    _replaceTask(task.copyWith(status: FfmpegTaskStatus.stopping));
    final result = await runtime.controller.stop(
      force: force,
      gracefulTimeout: gracefulTimeout,
      terminateTimeout: terminateTimeout,
      killTimeout: killTimeout,
    );

    if (result == FfmpegStopResult.failed) {
      final current = state.taskById(id);
      if (current != null) {
        _replaceTask(
          current.copyWith(
            status: previousStatus,
            stopResult: FfmpegStopResult.failed,
            errorMessage: 'Failed to stop FFmpeg task',
          ),
        );
      }
      return result;
    }

    await runtime.completion;
    return result;
  }

  Future<bool> removeTask(String id, {bool forceStop = false}) async {
    _assertNotDisposed();
    final task = _requireTask(id);
    if (task.status.reservesExecutionSlot) {
      final stopResult = await stopTask(id, force: forceStop);
      if (stopResult == FfmpegStopResult.failed) {
        return false;
      }
    }

    final removed = _removeTaskById(id);
    if (removed) {
      _schedulePump();
    }
    return removed;
  }

  void clearFinishedTasks() {
    clearTerminalTasks();
  }

  void clearTerminalTasks() {
    _assertNotDisposed();
    final filtered = _state.tasks
        .where((task) => !task.status.isTerminal)
        .toList(growable: false);
    if (filtered.length == _state.tasks.length) {
      return;
    }
    _setState(_state.copyWith(tasks: filtered));
  }

  void setMaxConcurrentTasks(int value) {
    _assertNotDisposed();
    final validatedValue = _validateMaxConcurrentTasks(value);
    if (validatedValue == _state.maxConcurrentTasks) {
      return;
    }
    _setState(_state.copyWith(maxConcurrentTasks: validatedValue));
    _schedulePump();
  }

  Future<void> dispose({bool forceStop = false}) async {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    final runtimes = _runtimes.values.toList(growable: false);
    _runtimes.clear();

    await Future.wait([
      for (final runtime in runtimes) runtime.dispose(forceStop: forceStop),
      for (final runtime in runtimes) runtime.completion,
    ]);

    await _stateController.close();
  }

  void _schedulePump() {
    if (_isDisposed) {
      return;
    }
    unawaited(_pumpQueue());
  }

  Future<void> _pumpQueue() async {
    if (_isDisposed) {
      return;
    }
    if (_isPumping) {
      _needsPump = true;
      return;
    }

    _isPumping = true;
    try {
      do {
        _needsPump = false;
        while (!_isDisposed &&
            _state.activeTaskCount < _state.maxConcurrentTasks) {
          final task = _nextQueuedTask();
          if (task == null) {
            break;
          }

          try {
            _startQueuedTask(task);
          } on Object catch (error) {
            _replaceTask(
              task.copyWith(
                status: FfmpegTaskStatus.failed,
                endedAt: _clock(),
                errorMessage: error.toString(),
              ),
            );
          }
        }
      } while (_needsPump);
    } finally {
      _isPumping = false;
    }
  }

  FfmpegTask? _nextQueuedTask() {
    for (final task in _state.tasks) {
      if (task.status == FfmpegTaskStatus.queued &&
          !_runtimes.containsKey(task.id)) {
        return task;
      }
    }
    return null;
  }

  void _startQueuedTask(FfmpegTask task) {
    final controller = _controllerFactory(task.command);
    final startedTask = task.copyWith(
      status: FfmpegTaskStatus.running,
      startedAt: _clock(),
      endedAt: null,
      progress: null,
      runResult: null,
      stopResult: null,
      errorMessage: null,
    );
    _replaceTask(startedTask);

    late final _TaskRuntime runtime;
    runtime = _TaskRuntime(
      controller: controller,
      progressSubscription: controller.progressStream.listen(
        (progress) =>
            _updateTask(task.id, (value) => value.copyWith(progress: progress)),
        onError: (Object error, StackTrace stackTrace) {
          _updateTask(
            task.id,
            (value) => value.copyWith(errorMessage: error.toString()),
          );
        },
      ),
      stdoutSubscription: controller.stdoutStream.listen(
        (line) => _updateTask(
          task.id,
          (value) => value.copyWith(lastStdoutLine: line),
        ),
      ),
      stderrSubscription: controller.stderrStream.listen(
        (line) => _updateTask(
          task.id,
          (value) => value.copyWith(lastStderrLine: line),
        ),
      ),
      completion: Future<void>.value(),
    );
    _runtimes[task.id] = runtime;
    runtime.completion = _handleRunCompletion(
      taskId: task.id,
      controller: controller,
      runtime: runtime,
    );
  }

  Future<void> _handleRunCompletion({
    required String taskId,
    required FfmpegProcessController controller,
    required _TaskRuntime runtime,
  }) async {
    try {
      final result = await controller.run();
      final current = state.taskById(taskId);
      if (current != null) {
        _replaceTask(
          current.copyWith(
            status: _statusFromRunResult(result),
            progress: result.finalProgress ?? current.progress,
            runResult: result,
            stopResult: _stopResultFromRunStatus(result.status),
            startedAt: current.startedAt ?? result.startedAt,
            endedAt: result.endedAt,
            errorMessage: result.status == FfmpegRunStatus.failed
                ? 'FFmpeg exited with code ${result.exitCode}'
                : null,
          ),
        );
      }
    } on Object catch (error) {
      final current = state.taskById(taskId);
      if (current != null) {
        _replaceTask(
          current.copyWith(
            status: FfmpegTaskStatus.failed,
            endedAt: _clock(),
            errorMessage: error.toString(),
          ),
        );
      }
    } finally {
      _runtimes.remove(taskId);
      await runtime.dispose();
      _schedulePump();
    }
  }

  FfmpegTaskStatus _statusFromRunResult(FfmpegRunResult result) {
    switch (result.status) {
      case FfmpegRunStatus.succeeded:
        return FfmpegTaskStatus.succeeded;
      case FfmpegRunStatus.gracefullyStopped:
      case FfmpegRunStatus.terminated:
      case FfmpegRunStatus.killed:
        return FfmpegTaskStatus.canceled;
      case FfmpegRunStatus.failed:
        return FfmpegTaskStatus.failed;
    }
  }

  FfmpegStopResult? _stopResultFromRunStatus(FfmpegRunStatus status) {
    switch (status) {
      case FfmpegRunStatus.succeeded:
      case FfmpegRunStatus.failed:
        return null;
      case FfmpegRunStatus.gracefullyStopped:
        return FfmpegStopResult.gracefullyStopped;
      case FfmpegRunStatus.terminated:
        return FfmpegStopResult.terminated;
      case FfmpegRunStatus.killed:
        return FfmpegStopResult.killed;
    }
  }

  void _updateTask(String id, FfmpegTask Function(FfmpegTask task) transform) {
    final task = state.taskById(id);
    if (task == null) {
      return;
    }
    _replaceTask(transform(task));
  }

  void _replaceTask(FfmpegTask updatedTask) {
    final tasks = [..._state.tasks];
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index == -1) {
      throw StateError('Task ${updatedTask.id} does not exist');
    }
    tasks[index] = updatedTask;
    _setState(_state.copyWith(tasks: tasks));
  }

  bool _removeTaskById(String id) {
    final tasks = [..._state.tasks];
    final index = tasks.indexWhere((task) => task.id == id);
    if (index == -1) {
      return false;
    }
    tasks.removeAt(index);
    _setState(_state.copyWith(tasks: tasks));
    return true;
  }

  FfmpegTask _requireTask(String id) {
    final task = state.taskById(id);
    if (task == null) {
      throw StateError('Task $id does not exist');
    }
    return task;
  }

  _TaskRuntime _requireRuntime(String id) {
    final runtime = _runtimes[id];
    if (runtime == null) {
      throw StateError('Task $id is not running');
    }
    return runtime;
  }

  void _ensureTaskDoesNotExist(String id) {
    if (state.taskById(id) != null) {
      throw StateError('Task $id already exists');
    }
  }

  void _setState(FfmpegQueueState nextState) {
    _state = nextState;
    if (!_stateController.isClosed) {
      _stateController.add(nextState);
    }
  }

  void _assertNotDisposed() {
    if (_isDisposed) {
      throw StateError('FfmpegQueueManager is already disposed');
    }
  }

  static int _validateMaxConcurrentTasks(int value) {
    if (value < 1) {
      throw ArgumentError.value(
        value,
        'value',
        'maxConcurrentTasks must be greater than 0',
      );
    }
    return value;
  }

  static String _defaultTaskIdGenerator() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }

  String _nextGeneratedTaskId() {
    return '${_idGenerator()}-${_taskSequence++}';
  }
}

class _TaskRuntime {
  _TaskRuntime({
    required this.controller,
    required this.progressSubscription,
    required this.stdoutSubscription,
    required this.stderrSubscription,
    required this.completion,
  });

  final FfmpegProcessController controller;
  final StreamSubscription<FFmpegProgress> progressSubscription;
  final StreamSubscription<String> stdoutSubscription;
  final StreamSubscription<String> stderrSubscription;
  Future<void> completion;
  bool _isDisposed = false;

  Future<void> dispose({bool forceStop = false}) async {
    if (_isDisposed) {
      return;
    }
    _isDisposed = true;
    await Future.wait([
      progressSubscription.cancel(),
      stdoutSubscription.cancel(),
      stderrSubscription.cancel(),
      controller.dispose(forceStop: forceStop),
    ]);
  }
}
