import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;

(String, String) _outputFormater(String line) {
  final parts = line.split('=');
  if (parts.length == 2) {
    final key = parts[0].trim();
    final value = parts[1].trim();
    return (key, value);
  }

  throw FormatException('无法解析的输出行: $line');
}

class FfmpegRunner {
  FfmpegRunner(this.command);

  final FfmpegCommand command;

  final _progressStreamController =
      StreamController<FFmpegProgress>.broadcast();
  final _stdoutStreamController = StreamController<String>.broadcast();
  final _stderrStreamController = StreamController<String>.broadcast();

  Stream<String> get stdoutStream => _stdoutStreamController.stream;
  Stream<String> get stderrStream => _stderrStreamController.stream;
  Stream<FFmpegProgress> get progressStream => _progressStreamController.stream;

  Process? _process;
  bool _isDisposed = false;

  Future<void> run({required String inputPath}) async {
    if (_isDisposed) {
      throw StateError('Already disposed');
    }

    final process = await Ffmpeg().run(command);
    _process = process;

    process.stdout.listen((event) {
      if (!_progressStreamController.hasListener) return;
      final lines = LineSplitter().convert(utf8.decode(event));
      final progressMap = <String, String>{};
      for (final line in lines) {
        if (line.trim().isEmpty) continue;
        final (key, value) = _outputFormater(line);
        progressMap[key] = value;
      }

      final progress = FFmpegProgress.fromJson(progressMap);

      _progressStreamController.add(progress);
    }, cancelOnError: true);

    process.stderr.listen((event) {
      if (!_stderrStreamController.hasListener) return;
      final output = utf8.decode(event);
      _stderrStreamController.add(output);
    }, cancelOnError: true);
  }

  void pause() {
    final process = _process;
    if (process == null) {
      throw StateError('Process is not running');
    }
    process.kill(ProcessSignal.sigstop);
  }

  void resume() {
    final process = _process;
    if (process == null) {
      throw StateError('Process is not running');
    }
    process.kill(ProcessSignal.sigcont);
  }

  bool stop([bool force = false]) {
    final process = _process;
    if (process == null) {
      throw StateError('Process is not running');
    }
    return process.kill(force ? ProcessSignal.sigkill : ProcessSignal.sigterm);
  }

  Future<void> dispose({bool forceStop = false}) async {
    if (_isDisposed) {
      throw StateError('Already disposed');
    }

    stop(forceStop);
    await _progressStreamController.close();
    await _stderrStreamController.close();
    await _stdoutStreamController.close();

    _isDisposed = true;
  }
}
