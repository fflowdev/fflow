import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fflow/core/ffmpeg/ffmpeg_process_controller.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_process_service.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_progress_parser.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;

enum FfmpegRunStatus {
  succeeded,
  failed,
  gracefullyStopped,
  terminated,
  killed,
}

enum FfmpegStopResult {
  notRunning,
  gracefullyStopped,
  terminated,
  killed,
  failed,
}

class FfmpegRunResult {
  const FfmpegRunResult({
    required this.exitCode,
    required this.status,
    required this.startedAt,
    required this.endedAt,
    this.finalProgress,
  });

  final int exitCode;
  final FfmpegRunStatus status;
  final DateTime startedAt;
  final DateTime endedAt;
  final FFmpegProgress? finalProgress;

  bool get succeeded => exitCode == 0;

  Duration get duration => endedAt.difference(startedAt);
}

enum _StopStage { none, graceful, terminate, kill }

class FfmpegRunner implements FfmpegProcessController {
  FfmpegRunner(
    FfmpegCommand command, {
    FfmpegProcessStarter? startProcess,
    FfmpegProgressParser? progressParser,
    DateTime Function()? clock,
    bool collectProgress = true,
  }) : command = _prepareCommand(command, collectProgress: collectProgress),
       _startProcess = startProcess ?? const CliFfmpegProcessService().call,
       _progressParser = progressParser ?? FfmpegProgressParser(),
       _clock = clock ?? DateTime.now,
       _collectProgress = collectProgress;

  final FfmpegCommand command;
  final FfmpegProcessStarter _startProcess;
  final FfmpegProgressParser _progressParser;
  final DateTime Function() _clock;
  final bool _collectProgress;

  final _progressStreamController =
      StreamController<FFmpegProgress>.broadcast();
  final _stdoutStreamController = StreamController<String>.broadcast();
  final _stderrStreamController = StreamController<String>.broadcast();

  Process? _process;
  // ignore: cancel_subscriptions
  StreamSubscription<String>? _stdoutSubscription;
  // ignore: cancel_subscriptions
  StreamSubscription<String>? _stderrSubscription;
  Completer<void>? _stdoutDone;
  Completer<void>? _stderrDone;
  Future<int>? _exitCodeFuture;
  Future<FfmpegRunResult>? _runFuture;
  bool _isDisposed = false;
  bool _isPaused = false;
  bool _streamsClosed = false;
  _StopStage _stopStage = _StopStage.none;

  @override
  FFmpegProgress? latestProgress;

  @override
  Stream<String> get stdoutStream => _stdoutStreamController.stream;
  @override
  Stream<String> get stderrStream => _stderrStreamController.stream;
  @override
  Stream<FFmpegProgress> get progressStream => _progressStreamController.stream;

  @override
  bool get isRunning => _process != null;
  @override
  bool get isPaused => _isPaused;
  @override
  bool get supportsPause => !Platform.isWindows;

  @override
  Future<FfmpegRunResult> run() async {
    if (_isDisposed) {
      throw StateError('Already disposed');
    }
    if (_runFuture != null) {
      throw StateError('Runner has already been started');
    }

    final future = _runInternal();
    _runFuture = future;
    return future;
  }

  @override
  void pause() {
    if (!supportsPause) {
      throw UnsupportedError('Pausing FFmpeg is not supported on Windows');
    }
    _requireRunningProcess().kill(ProcessSignal.sigstop);
    _isPaused = true;
  }

  @override
  void resume() {
    if (!supportsPause) {
      throw UnsupportedError('Resuming FFmpeg is not supported on Windows');
    }
    _requireRunningProcess().kill(ProcessSignal.sigcont);
    _isPaused = false;
  }

  @override
  Future<FfmpegStopResult> stop({
    bool force = false,
    Duration gracefulTimeout = const Duration(seconds: 5),
    Duration terminateTimeout = const Duration(seconds: 2),
    Duration killTimeout = const Duration(seconds: 1),
  }) async {
    final process = _process;
    if (process == null) {
      return FfmpegStopResult.notRunning;
    }

    if (force) {
      return _requestSignalStop(
        process,
        signal: ProcessSignal.sigkill,
        timeout: killTimeout,
        stage: _StopStage.kill,
        result: FfmpegStopResult.killed,
      );
    }

    final stoppedGracefully = await _requestGracefulStop(
      process,
      gracefulTimeout,
    );
    if (stoppedGracefully) {
      return FfmpegStopResult.gracefullyStopped;
    }

    final terminated = await _requestSignalStop(
      process,
      signal: ProcessSignal.sigterm,
      timeout: terminateTimeout,
      stage: _StopStage.terminate,
      result: FfmpegStopResult.terminated,
    );
    if (terminated != FfmpegStopResult.failed) {
      return terminated;
    }

    return _requestSignalStop(
      process,
      signal: ProcessSignal.sigkill,
      timeout: killTimeout,
      stage: _StopStage.kill,
      result: FfmpegStopResult.killed,
    );
  }

  @override
  Future<void> dispose({bool forceStop = false}) async {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    await stop(force: forceStop);

    final runFuture = _runFuture;
    if (runFuture != null) {
      try {
        await runFuture;
      } on Object {
        // The caller should observe the original run failure, if any.
      }
      return;
    }

    await _closeControllers();
  }

  void _listenToProcessOutput(Process process) {
    _stdoutDone = Completer<void>();
    _stderrDone = Completer<void>();

    _stdoutSubscription = process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen(
          _handleStdoutLine,
          onError: (Object error, StackTrace stackTrace) {
            _addStdoutError(error, stackTrace);
            _completeStdout();
          },
          onDone: _completeStdout,
        );

    _stderrSubscription = process.stderr
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen(
          _handleStderrLine,
          onError: (Object error, StackTrace stackTrace) {
            _addStderrError(error, stackTrace);
            _completeStderr();
          },
          onDone: _completeStderr,
        );
  }

  void _handleStdoutLine(String line) {
    _addStdoutLine(line);
    if (!_collectProgress) {
      return;
    }

    try {
      final progress = _progressParser.addLine(line);
      if (progress == null) {
        return;
      }

      latestProgress = progress;
      if (!_isDisposed && !_progressStreamController.isClosed) {
        _progressStreamController.add(progress);
      }
    } on Object catch (error, stackTrace) {
      if (!_isDisposed && !_progressStreamController.isClosed) {
        _progressStreamController.addError(error, stackTrace);
      }
    }
  }

  void _handleStderrLine(String line) {
    if (!_isDisposed && !_stderrStreamController.isClosed) {
      _stderrStreamController.add(line);
    }
  }

  Future<bool> _requestGracefulStop(
    Process process,
    Duration gracefulTimeout,
  ) async {
    _stopStage = _StopStage.graceful;
    _isPaused = false;

    try {
      process.stdin.writeln('q');
      await process.stdin.flush();
      await process.stdin.close();
    } on Object {
      // The process may already be gone or stdin may have been closed.
    }

    return _waitForExit(process, gracefulTimeout);
  }

  Future<FfmpegStopResult> _requestSignalStop(
    Process process, {
    required ProcessSignal signal,
    required Duration timeout,
    required _StopStage stage,
    required FfmpegStopResult result,
  }) async {
    _stopStage = stage;
    _isPaused = false;

    if (!process.kill(signal)) {
      return FfmpegStopResult.failed;
    }

    final exited = await _waitForExit(process, timeout);
    return exited ? result : FfmpegStopResult.failed;
  }

  Future<bool> _waitForExit(Process process, Duration timeout) async {
    final exitFuture = (_exitCodeFuture ?? process.exitCode).then<bool>(
      (_) => true,
    );
    return exitFuture.timeout(
      timeout,
      onTimeout: () => false,
    );
  }

  Future<void> _waitForOutputStreams() async {
    await Future.wait([
      if (_stdoutDone != null) _stdoutDone!.future,
      if (_stderrDone != null) _stderrDone!.future,
    ]);
  }

  Future<FfmpegRunResult> _runInternal() async {
    final startedAt = _clock();

    try {
      final process = await _startProcess(command);
      _exitCodeFuture = process.exitCode;
      _process = process;
      _listenToProcessOutput(process);

      final exitCode = await _exitCodeFuture!;
      await _waitForOutputStreams();

      return FfmpegRunResult(
        exitCode: exitCode,
        status: _resolveRunStatus(exitCode),
        startedAt: startedAt,
        endedAt: _clock(),
        finalProgress: latestProgress,
      );
    } finally {
      _process = null;
      _isPaused = false;
      _exitCodeFuture = null;
      _progressParser.reset();
      await _cancelSubscriptions();
      await _closeControllers();
    }
  }

  FfmpegRunStatus _resolveRunStatus(int exitCode) {
    switch (_stopStage) {
      case _StopStage.none:
        return exitCode == 0
            ? FfmpegRunStatus.succeeded
            : FfmpegRunStatus.failed;
      case _StopStage.graceful:
        return FfmpegRunStatus.gracefullyStopped;
      case _StopStage.terminate:
        return FfmpegRunStatus.terminated;
      case _StopStage.kill:
        return FfmpegRunStatus.killed;
    }
  }

  Future<void> _cancelSubscriptions() async {
    final stdoutSubscription = _stdoutSubscription;
    final stderrSubscription = _stderrSubscription;
    _stdoutSubscription = null;
    _stderrSubscription = null;

    await Future.wait([
      if (stdoutSubscription != null) stdoutSubscription.cancel(),
      if (stderrSubscription != null) stderrSubscription.cancel(),
    ]);
    _completeStdout();
    _completeStderr();
  }

  Future<void> _closeControllers() async {
    if (_streamsClosed) {
      return;
    }

    _streamsClosed = true;
    await Future.wait([
      _progressStreamController.close(),
      _stderrStreamController.close(),
      _stdoutStreamController.close(),
    ]);
  }

  Process _requireRunningProcess() {
    final process = _process;
    if (process == null) {
      throw StateError('Process is not running');
    }
    return process;
  }

  void _addStdoutLine(String line) {
    if (!_isDisposed && !_stdoutStreamController.isClosed) {
      _stdoutStreamController.add(line);
    }
  }

  void _addStdoutError(Object error, StackTrace stackTrace) {
    if (!_isDisposed && !_stdoutStreamController.isClosed) {
      _stdoutStreamController.addError(error, stackTrace);
    }
  }

  void _addStderrError(Object error, StackTrace stackTrace) {
    if (!_isDisposed && !_stderrStreamController.isClosed) {
      _stderrStreamController.addError(error, stackTrace);
    }
  }

  void _completeStdout() {
    final stdoutDone = _stdoutDone;
    if (stdoutDone != null && !stdoutDone.isCompleted) {
      stdoutDone.complete();
    }
  }

  void _completeStderr() {
    final stderrDone = _stderrDone;
    if (stderrDone != null && !stderrDone.isCompleted) {
      stderrDone.complete();
    }
  }

  static FfmpegCommand _prepareCommand(
    FfmpegCommand command, {
    required bool collectProgress,
  }) {
    if (!collectProgress) {
      return command;
    }

    for (final arg in command.args) {
      if (arg.name != 'progress') {
        continue;
      }

      if (arg.value != 'pipe:1') {
        throw ArgumentError.value(
          arg.value,
          'command',
          'FfmpegRunner requires -progress pipe:1 when progress '
              'collection is enabled.',
        );
      }

      return command;
    }

    return _copyCommandWithArgs(
      command,
      [...command.args, const CliArg(name: 'progress', value: 'pipe:1')],
    );
  }

  static FfmpegCommand _copyCommandWithArgs(
    FfmpegCommand command,
    List<CliArg> args,
  ) {
    final filterGraph = command.filterGraph;
    if (filterGraph != null) {
      return FfmpegCommand.complex(
        ffmpegPath: command.ffmpegPath,
        inputs: command.inputs,
        args: args,
        filterGraph: filterGraph,
        outputFilepath: command.outputFilepath,
      );
    }

    return FfmpegCommand.simple(
      ffmpegPath: command.ffmpegPath,
      inputs: command.inputs,
      args: args,
      outputFilepath: command.outputFilepath,
    );
  }
}
