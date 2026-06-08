import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FfmpegRunner', () {
    test(
      'injects progress pipe, forwards streams, and closes on completion',
      () async {
        final process = FakeProcess();
        final service = FakeFfmpegProcessStarter(process);
        final runner = FfmpegRunner(_command(), startProcess: service.call);

        final stdoutFuture = runner.stdoutStream.toList();
        final stderrFuture = runner.stderrStream.toList();
        final progressValues = <FFmpegProgress>[];
        final progressDone = Completer<void>();
        final progressSubscription = runner.progressStream.listen(
          progressValues.add,
          onDone: progressDone.complete,
        );

        final runFuture = runner.run();
        await Future<void>.delayed(Duration.zero);

        expect(
          service.lastCommand?.args.any(
            (arg) => arg.name == 'progress' && arg.value == 'pipe:1',
          ),
          isTrue,
        );

        process
          ..emitStdoutLine('frame=120')
          ..emitStdoutLine('fps=25.2')
          ..emitStdoutLine('progress=end')
          ..emitStderrLine('warning')
          ..completeExit(0);
        await process.closeOutput();

        final result = await runFuture;
        await progressDone.future;

        expect(result.status, FfmpegRunStatus.succeeded);
        expect(result.finalProgress?.frame, 120);
        expect(runner.latestProgress?.fps, 25.2);
        expect(await stdoutFuture, ['frame=120', 'fps=25.2', 'progress=end']);
        expect(await stderrFuture, ['warning']);
        expect(progressValues.single.frame, 120);

        await progressSubscription.cancel();
      },
    );

    test('stops gracefully after writing q to stdin', () async {
      final process = FakeProcess(
        onStdinText: (process, stdinText) {
          if (!stdinText.contains('q')) {
            return;
          }

          process.completeExit(0);
          unawaited(process.closeOutput());
        },
      );
      final runner = FfmpegRunner(
        _command(),
        startProcess: FakeFfmpegProcessStarter(process).call,
      );

      final runFuture = runner.run();
      await Future<void>.delayed(Duration.zero);

      final stopResult = await runner.stop(
        gracefulTimeout: const Duration(milliseconds: 50),
      );
      final runResult = await runFuture;

      expect(stopResult, FfmpegStopResult.gracefullyStopped);
      expect(runResult.status, FfmpegRunStatus.gracefullyStopped);
      expect(process.stdinText, contains('q'));
      expect(process.killSignals, isEmpty);
    });

    test('falls back to terminate when graceful stop times out', () async {
      final process = FakeProcess(
        onKill: (process, signal) {
          if (signal != ProcessSignal.sigterm) {
            return true;
          }

          process.completeExit(255);
          unawaited(process.closeOutput());
          return true;
        },
      );
      final runner = FfmpegRunner(
        _command(),
        startProcess: FakeFfmpegProcessStarter(process).call,
      );

      final runFuture = runner.run();
      await Future<void>.delayed(Duration.zero);

      final stopResult = await runner.stop(
        gracefulTimeout: Duration.zero,
        terminateTimeout: const Duration(milliseconds: 50),
      );
      final runResult = await runFuture;

      expect(stopResult, FfmpegStopResult.terminated);
      expect(runResult.status, FfmpegRunStatus.terminated);
      expect(process.stdinText, contains('q'));
      expect(process.killSignals, [ProcessSignal.sigterm]);
    });

    test('rejects incompatible progress output configuration', () {
      expect(
        () => FfmpegRunner(
          const FfmpegCommand.simple(
            ffmpegPath: 'ffmpeg',
            args: [CliArg(name: 'progress', value: 'pipe:3')],
            outputFilepath: 'output.mp4',
          ),
        ),
        throwsArgumentError,
      );
    });
  });
}

FfmpegCommand _command() {
  return const FfmpegCommand.simple(
    ffmpegPath: 'ffmpeg',
    outputFilepath: 'output.mp4',
  );
}

class FakeFfmpegProcessStarter {
  FakeFfmpegProcessStarter(this.process);

  final Process process;
  FfmpegCommand? lastCommand;

  Future<Process> call(FfmpegCommand command) async {
    lastCommand = command;
    return process;
  }
}

class FakeProcess implements Process {
  FakeProcess({this.onStdinText, this.onKill})
    : _stdinConsumer = _RecordingStreamConsumer() {
    _stdinConsumer.onChunk = (chunk) {
      _stdinBuffer.write(utf8.decode(chunk));
      onStdinText?.call(this, _stdinBuffer.toString());
    };
    _stdin = IOSink(_stdinConsumer);
  }

  final void Function(FakeProcess process, String stdinText)? onStdinText;
  final bool Function(FakeProcess process, ProcessSignal signal)? onKill;
  final _stdoutController = StreamController<List<int>>();
  final _stderrController = StreamController<List<int>>();
  final _exitCodeCompleter = Completer<int>();
  final _stdinBuffer = StringBuffer();
  final _RecordingStreamConsumer _stdinConsumer;
  final killSignals = <ProcessSignal>[];
  late final IOSink _stdin;

  String get stdinText => _stdinBuffer.toString();

  void emitStdoutLine(String line) {
    _stdoutController.add(utf8.encode('$line\n'));
  }

  void emitStderrLine(String line) {
    _stderrController.add(utf8.encode('$line\n'));
  }

  void completeExit(int exitCode) {
    if (!_exitCodeCompleter.isCompleted) {
      _exitCodeCompleter.complete(exitCode);
    }
  }

  Future<void> closeOutput() async {
    await _stdoutController.close();
    await _stderrController.close();
  }

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  int get pid => 1;

  @override
  IOSink get stdin => _stdin;

  @override
  Stream<List<int>> get stderr => _stderrController.stream;

  @override
  Stream<List<int>> get stdout => _stdoutController.stream;

  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    killSignals.add(signal);
    return onKill?.call(this, signal) ?? true;
  }
}

class _RecordingStreamConsumer implements StreamConsumer<List<int>> {
  void Function(List<int> chunk)? onChunk;

  @override
  Future<void> addStream(Stream<List<int>> stream) async {
    final onChunk = this.onChunk;
    if (onChunk == null) {
      await stream.drain<void>();
      return;
    }

    await stream.forEach(onChunk);
  }

  @override
  Future<void> close() async {}
}
