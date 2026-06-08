import 'dart:async';

import 'package:fflow/core/ffmpeg/ffmpeg_process_controller.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_queue_manager.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_task.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FfmpegQueueManager', () {
    test('respects concurrency and starts the next queued task', () async {
      final first = FakeFfmpegProcessController();
      final second = FakeFfmpegProcessController();
      final third = FakeFfmpegProcessController();
      final manager = FfmpegQueueManager(
        controllerFactory: QueueControllerFactory([first, second, third]).call,
        initialMaxConcurrentTasks: 2,
        supportsPause: true,
      );
      addTearDown(manager.dispose);

      final task1 = manager.enqueue(_command('output-1.mp4'));
      final task2 = manager.enqueue(_command('output-2.mp4'));
      final task3 = manager.enqueue(_command('output-3.mp4'));
      await _settle();

      expect(
        manager.state.taskById(task1.id)?.status,
        FfmpegTaskStatus.running,
      );
      expect(
        manager.state.taskById(task2.id)?.status,
        FfmpegTaskStatus.running,
      );
      expect(manager.state.taskById(task3.id)?.status, FfmpegTaskStatus.queued);
      expect(first.runCount, 1);
      expect(second.runCount, 1);
      expect(third.runCount, 0);

      first.completeSuccess();
      await _settle();

      expect(
        manager.state.taskById(task1.id)?.status,
        FfmpegTaskStatus.succeeded,
      );
      expect(
        manager.state.taskById(task3.id)?.status,
        FfmpegTaskStatus.running,
      );
      expect(third.runCount, 1);

      second.completeSuccess();
      third.completeSuccess();
      await _settle();

      expect(manager.state.completedTaskCount, 3);
    });

    test('can pause and resume a running task', () async {
      final controller = FakeFfmpegProcessController();
      final manager = FfmpegQueueManager(
        controllerFactory: QueueControllerFactory([controller]).call,
        supportsPause: true,
      );
      addTearDown(manager.dispose);

      final task = manager.enqueue(_command('output.mp4'));
      await _settle();

      await manager.pauseTask(task.id);
      expect(manager.state.taskById(task.id)?.status, FfmpegTaskStatus.paused);
      expect(controller.pauseCount, 1);

      await manager.resumeTask(task.id);
      expect(manager.state.taskById(task.id)?.status, FfmpegTaskStatus.running);
      expect(controller.resumeCount, 1);

      controller.completeSuccess();
      await _settle();
      expect(
        manager.state.taskById(task.id)?.status,
        FfmpegTaskStatus.succeeded,
      );
    });

    test('stops a queued task without starting it', () async {
      final first = FakeFfmpegProcessController();
      final second = FakeFfmpegProcessController();
      final manager = FfmpegQueueManager(
        controllerFactory: QueueControllerFactory([first, second]).call,
        supportsPause: true,
      );
      addTearDown(manager.dispose);

      final runningTask = manager.enqueue(_command('running.mp4'));
      final queuedTask = manager.enqueue(_command('queued.mp4'));
      await _settle();

      final stopResult = await manager.stopTask(queuedTask.id);

      expect(stopResult, FfmpegStopResult.notRunning);
      expect(
        manager.state.taskById(queuedTask.id)?.status,
        FfmpegTaskStatus.canceled,
      );
      expect(second.runCount, 0);

      first.completeSuccess();
      await _settle();

      expect(
        manager.state.taskById(runningTask.id)?.status,
        FfmpegTaskStatus.succeeded,
      );
      expect(
        manager.state.taskById(queuedTask.id)?.status,
        FfmpegTaskStatus.canceled,
      );
    });

    test('removes a running task and frees a slot for the next task', () async {
      final first = FakeFfmpegProcessController();
      final second = FakeFfmpegProcessController();
      final manager = FfmpegQueueManager(
        controllerFactory: QueueControllerFactory([first, second]).call,
        supportsPause: true,
      );
      addTearDown(manager.dispose);

      final task1 = manager.enqueue(_command('first.mp4'));
      final task2 = manager.enqueue(_command('second.mp4'));
      await _settle();

      final removed = await manager.removeTask(task1.id);
      await _settle();

      expect(removed, isTrue);
      expect(manager.state.taskById(task1.id), isNull);
      expect(
        manager.state.taskById(task2.id)?.status,
        FfmpegTaskStatus.running,
      );
      expect(first.stopCount, 1);
      expect(second.runCount, 1);

      second.completeSuccess();
      await _settle();
      expect(
        manager.state.taskById(task2.id)?.status,
        FfmpegTaskStatus.succeeded,
      );
    });

    test(
      'starts more queued tasks after raising the concurrency limit',
      () async {
        final first = FakeFfmpegProcessController();
        final second = FakeFfmpegProcessController();
        final third = FakeFfmpegProcessController();
        final manager = FfmpegQueueManager(
          controllerFactory: QueueControllerFactory([
            first,
            second,
            third,
          ]).call,
          supportsPause: true,
        );
        addTearDown(manager.dispose);

        final task1 = manager.enqueue(_command('first.mp4'));
        final task2 = manager.enqueue(_command('second.mp4'));
        final task3 = manager.enqueue(_command('third.mp4'));
        await _settle();

        expect(
          manager.state.taskById(task1.id)?.status,
          FfmpegTaskStatus.running,
        );
        expect(
          manager.state.taskById(task2.id)?.status,
          FfmpegTaskStatus.queued,
        );
        expect(
          manager.state.taskById(task3.id)?.status,
          FfmpegTaskStatus.queued,
        );

        manager.setMaxConcurrentTasks(2);
        await _settle();

        expect(
          manager.state.taskById(task2.id)?.status,
          FfmpegTaskStatus.running,
        );
        expect(
          manager.state.taskById(task3.id)?.status,
          FfmpegTaskStatus.queued,
        );
        expect(second.runCount, 1);
        expect(third.runCount, 0);
      },
    );
  });
}

FfmpegCommand _command(String outputFilepath) {
  return FfmpegCommand.simple(
    ffmpegPath: 'ffmpeg',
    outputFilepath: outputFilepath,
  );
}

Future<void> _settle() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

class QueueControllerFactory {
  QueueControllerFactory(this.controllers);

  final List<FakeFfmpegProcessController> controllers;
  int _index = 0;

  FfmpegProcessController call(FfmpegCommand command) {
    final controller = controllers[_index];
    _index += 1;
    controller.command = command;
    return controller;
  }
}

class FakeFfmpegProcessController implements FfmpegProcessController {
  FakeFfmpegProcessController({
    this.supportsPause = true,
    this.stopResult = FfmpegStopResult.gracefullyStopped,
  });

  final StreamController<String> _stdoutController =
      StreamController<String>.broadcast();
  final StreamController<String> _stderrController =
      StreamController<String>.broadcast();
  final StreamController<FFmpegProgress> _progressController =
      StreamController<FFmpegProgress>.broadcast();
  final Completer<FfmpegRunResult> _runCompleter = Completer<FfmpegRunResult>();

  @override
  final bool supportsPause;

  final FfmpegStopResult stopResult;
  int runCount = 0;
  int pauseCount = 0;
  int resumeCount = 0;
  int stopCount = 0;
  int disposeCount = 0;
  bool _isRunning = false;
  bool _isPaused = false;

  FfmpegCommand? command;

  @override
  FFmpegProgress? latestProgress;

  @override
  bool get isPaused => _isPaused;

  @override
  bool get isRunning => _isRunning;

  @override
  Stream<FFmpegProgress> get progressStream => _progressController.stream;

  @override
  Stream<String> get stderrStream => _stderrController.stream;

  @override
  Stream<String> get stdoutStream => _stdoutController.stream;

  @override
  void pause() {
    if (!supportsPause) {
      throw UnsupportedError('pause');
    }
    pauseCount += 1;
    _isPaused = true;
  }

  @override
  void resume() {
    if (!supportsPause) {
      throw UnsupportedError('resume');
    }
    resumeCount += 1;
    _isPaused = false;
  }

  @override
  Future<FfmpegRunResult> run() {
    runCount += 1;
    _isRunning = true;
    return _runCompleter.future.whenComplete(() async {
      _isRunning = false;
      _isPaused = false;
      await _closeStreams();
    });
  }

  void completeSuccess() {
    _complete(
      FfmpegRunResult(
        exitCode: 0,
        status: FfmpegRunStatus.succeeded,
        startedAt: DateTime(2026, 1, 1),
        endedAt: DateTime(2026, 1, 1, 0, 0, 1),
      ),
    );
  }

  @override
  Future<FfmpegStopResult> stop({
    bool force = false,
    Duration gracefulTimeout = const Duration(seconds: 5),
    Duration terminateTimeout = const Duration(seconds: 2),
    Duration killTimeout = const Duration(seconds: 1),
  }) async {
    stopCount += 1;
    if (stopResult == FfmpegStopResult.failed) {
      return stopResult;
    }

    _complete(
      FfmpegRunResult(
        exitCode: stopResult == FfmpegStopResult.gracefullyStopped ? 0 : 255,
        status: switch (stopResult) {
          FfmpegStopResult.gracefullyStopped =>
            FfmpegRunStatus.gracefullyStopped,
          FfmpegStopResult.terminated => FfmpegRunStatus.terminated,
          FfmpegStopResult.killed => FfmpegRunStatus.killed,
          FfmpegStopResult.notRunning => FfmpegRunStatus.gracefullyStopped,
          FfmpegStopResult.failed => FfmpegRunStatus.failed,
        },
        startedAt: DateTime(2026, 1, 1),
        endedAt: DateTime(2026, 1, 1, 0, 0, 1),
      ),
    );
    return stopResult;
  }

  @override
  Future<void> dispose({bool forceStop = false}) async {
    disposeCount += 1;
    if (!_runCompleter.isCompleted) {
      _complete(
        FfmpegRunResult(
          exitCode: forceStop ? 255 : 0,
          status: forceStop
              ? FfmpegRunStatus.killed
              : FfmpegRunStatus.gracefullyStopped,
          startedAt: DateTime(2026, 1, 1),
          endedAt: DateTime(2026, 1, 1, 0, 0, 1),
        ),
      );
    }
    await _closeStreams();
  }

  void _complete(FfmpegRunResult result) {
    if (_runCompleter.isCompleted) {
      return;
    }
    _runCompleter.complete(result);
  }

  Future<void> _closeStreams() async {
    await Future.wait([
      if (!_stdoutController.isClosed) _stdoutController.close(),
      if (!_stderrController.isClosed) _stderrController.close(),
      if (!_progressController.isClosed) _progressController.close(),
    ]);
  }
}
