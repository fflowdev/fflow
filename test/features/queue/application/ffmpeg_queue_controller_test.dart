import 'dart:async';

import 'package:fflow/core/ffmpeg/ffmpeg_process_controller.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_task.dart';
import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/queue/application/ffmpeg_queue_controller.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await storage.initialize();
  });

  group('FfmpegQueueController', () {
    test(
      'enqueueSimpleTask builds a command and tracks task completion',
      () async {
        final fakeController = _FakeFfmpegProcessController();
        final container = ProviderContainer(
          overrides: [
            queueProcessControllerFactoryProvider.overrideWithValue(
              (command) {
                fakeController.command = command;
                return fakeController;
              },
            ),
            appSettingsProvider.overrideWithValue(AppSettings.def()),
          ],
        );
        addTearDown(container.dispose);

        final notifier = container.read(ffmpegQueueControllerProvider.notifier);
        final task = notifier.enqueueSimpleTask(
          ffmpegPath: r'  C:\ffmpeg\ffmpeg.exe  ',
          inputPath: r'D:\input\clip.mov',
          outputFilepath: r'D:\output\clip.mp4',
          label: '  Export Clip  ',
          args: const [
            CliArg(name: 'y'),
            CliArg(name: 'preset', value: 'fast'),
          ],
        );

        await _settle();

        final runningTask = container
            .read(ffmpegQueueControllerProvider)
            .taskById(task.id);
        expect(runningTask?.status, FfmpegTaskStatus.running);
        expect(fakeController.command?.ffmpegPath, r'C:\ffmpeg\ffmpeg.exe');
        expect(
          fakeController.command?.inputs.single.toCli(),
          r'-i D:\input\clip.mov',
        );
        expect(fakeController.command?.outputFilepath, r'D:\output\clip.mp4');
        expect(fakeController.command?.args, const [
          CliArg(name: 'y'),
          CliArg(name: 'preset', value: 'fast'),
        ]);

        fakeController.completeSuccess();
        await _settle();

        final completedTask = container
            .read(ffmpegQueueControllerProvider)
            .taskById(task.id);
        expect(completedTask?.label, 'Export Clip');
        expect(completedTask?.status, FfmpegTaskStatus.succeeded);
      },
    );

    test('clearFinishedTasks removes completed tasks from state', () async {
      final fakeController = _FakeFfmpegProcessController();
      final container = ProviderContainer(
        overrides: [
          queueProcessControllerFactoryProvider.overrideWithValue(
            (command) {
              fakeController.command = command;
              return fakeController;
            },
          ),
          appSettingsProvider.overrideWithValue(AppSettings.def()),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(ffmpegQueueControllerProvider.notifier);
      final task = notifier.enqueueSimpleTask(
        inputPath: r'D:\input\clip.mov',
        outputFilepath: r'D:\output\clip.mp4',
      );

      await _settle();
      fakeController.completeSuccess();
      await _settle();

      expect(
        container.read(ffmpegQueueControllerProvider).taskById(task.id)?.status,
        FfmpegTaskStatus.succeeded,
      );

      notifier.clearFinishedTasks();
      await _settle();

      expect(
        container.read(ffmpegQueueControllerProvider).taskById(task.id),
        isNull,
      );
    });

    test(
      'uses app settings for initial concurrency and syncs updates without '
      'dropping tasks',
      () async {
        final firstController = _FakeFfmpegProcessController();
        final secondController = _FakeFfmpegProcessController();
        final factory = _QueueControllerFactory([
          firstController,
          secondController,
        ]);
        final container = ProviderContainer(
          overrides: [
            queueProcessControllerFactoryProvider.overrideWithValue(
              factory.call,
            ),
          ],
        );
        addTearDown(container.dispose);

        container
            .read(appSettingsProvider.notifier)
            .updateMaxConcurrentTasks(2);

        final notifier = container.read(ffmpegQueueControllerProvider.notifier);
        final task1 = notifier.enqueueSimpleTask(
          inputPath: r'D:\input\clip-1.mov',
          outputFilepath: r'D:\output\clip-1.mp4',
        );
        final task2 = notifier.enqueueSimpleTask(
          inputPath: r'D:\input\clip-2.mov',
          outputFilepath: r'D:\output\clip-2.mp4',
        );

        await _settle();

        final initialState = container.read(ffmpegQueueControllerProvider);
        expect(initialState.maxConcurrentTasks, 2);
        expect(
          initialState.taskById(task1.id)?.status,
          FfmpegTaskStatus.running,
        );
        expect(
          initialState.taskById(task2.id)?.status,
          FfmpegTaskStatus.running,
        );

        container
            .read(appSettingsProvider.notifier)
            .updateMaxConcurrentTasks(1);
        await _settle();

        final updatedState = container.read(ffmpegQueueControllerProvider);
        expect(updatedState.maxConcurrentTasks, 1);
        expect(updatedState.tasks, hasLength(2));
        expect(updatedState.taskById(task1.id), isNotNull);
        expect(updatedState.taskById(task2.id), isNotNull);
        expect(firstController.runCount, 1);
        expect(secondController.runCount, 1);
      },
    );
  });
}

Future<void> _settle() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

class _FakeFfmpegProcessController implements FfmpegProcessController {
  final StreamController<String> _stdoutController =
      StreamController<String>.broadcast();
  final StreamController<String> _stderrController =
      StreamController<String>.broadcast();
  final StreamController<FFmpegProgress> _progressController =
      StreamController<FFmpegProgress>.broadcast();
  final Completer<FfmpegRunResult> _runCompleter = Completer<FfmpegRunResult>();

  FfmpegCommand? command;
  bool _isRunning = false;
  int runCount = 0;

  @override
  FFmpegProgress? latestProgress;

  @override
  bool get isPaused => false;

  @override
  bool get isRunning => _isRunning;

  @override
  Stream<FFmpegProgress> get progressStream => _progressController.stream;

  @override
  Stream<String> get stderrStream => _stderrController.stream;

  @override
  Stream<String> get stdoutStream => _stdoutController.stream;

  @override
  bool get supportsPause => true;

  @override
  void pause() {}

  @override
  void resume() {}

  @override
  Future<FfmpegRunResult> run() {
    _isRunning = true;
    runCount += 1;
    return _runCompleter.future.whenComplete(() async {
      _isRunning = false;
      await Future.wait([
        if (!_stdoutController.isClosed) _stdoutController.close(),
        if (!_stderrController.isClosed) _stderrController.close(),
        if (!_progressController.isClosed) _progressController.close(),
      ]);
    });
  }

  void completeSuccess() {
    if (_runCompleter.isCompleted) {
      return;
    }

    _runCompleter.complete(
      FfmpegRunResult(
        exitCode: 0,
        status: FfmpegRunStatus.succeeded,
        startedAt: DateTime(2026, 1, 1, 0, 0, 0),
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
    completeSuccess();
    return FfmpegStopResult.gracefullyStopped;
  }

  @override
  Future<void> dispose({bool forceStop = false}) async {
    completeSuccess();
    await Future.wait([
      if (!_stdoutController.isClosed) _stdoutController.close(),
      if (!_stderrController.isClosed) _stderrController.close(),
      if (!_progressController.isClosed) _progressController.close(),
    ]);
  }
}

class _QueueControllerFactory {
  _QueueControllerFactory(this.controllers);

  final List<_FakeFfmpegProcessController> controllers;
  int _index = 0;

  FfmpegProcessController call(FfmpegCommand command) {
    final controller = controllers[_index];
    _index += 1;
    controller.command = command;
    return controller;
  }
}
