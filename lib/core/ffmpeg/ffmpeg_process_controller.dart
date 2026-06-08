import 'dart:async';

import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;

typedef FfmpegProcessControllerFactory =
    FfmpegProcessController Function(FfmpegCommand command);

abstract interface class FfmpegProcessController {
  Stream<String> get stdoutStream;
  Stream<String> get stderrStream;
  Stream<FFmpegProgress> get progressStream;

  FFmpegProgress? get latestProgress;

  bool get isRunning;
  bool get isPaused;
  bool get supportsPause;

  Future<FfmpegRunResult> run();

  void pause();

  void resume();

  Future<FfmpegStopResult> stop({
    bool force = false,
    Duration gracefulTimeout = const Duration(seconds: 5),
    Duration terminateTimeout = const Duration(seconds: 2),
    Duration killTimeout = const Duration(seconds: 1),
  });

  Future<void> dispose({bool forceStop = false});
}

FfmpegProcessController defaultFfmpegProcessControllerFactory(
  FfmpegCommand command,
) {
  return FfmpegRunner(command);
}
