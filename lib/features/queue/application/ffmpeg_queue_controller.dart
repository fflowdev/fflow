import 'dart:async';

import 'package:fflow/core/ffmpeg/ffmpeg_process_controller.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_queue_manager.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_task.dart';
import 'package:fflow/core/settings/app_settings.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queueProcessControllerFactoryProvider =
    Provider<FfmpegProcessControllerFactory>(
      (ref) => defaultFfmpegProcessControllerFactory,
    );

final ffmpegQueueControllerProvider =
    NotifierProvider<FfmpegQueueController, FfmpegQueueState>(
      FfmpegQueueController.new,
    );

class FfmpegQueueController extends Notifier<FfmpegQueueState> {
  late final FfmpegQueueManager _manager;

  @override
  FfmpegQueueState build() {
    final initialMaxConcurrentTasks = ref.read(
      appSettingsProvider.select((state) => state.maxConcurrentTasks),
    );
    final manager = _manager = FfmpegQueueManager(
      controllerFactory: ref.watch(queueProcessControllerFactoryProvider),
      initialMaxConcurrentTasks: initialMaxConcurrentTasks,
    );

    final subscription = manager.states.listen((nextState) {
      state = nextState;
    });

    ref.listen<int>(
      appSettingsProvider.select((state) => state.maxConcurrentTasks),
      (previous, next) {
        if (previous == next) {
          return;
        }
        manager.setMaxConcurrentTasks(next);
      },
    );

    ref.onDispose(
      () => unawaited(
        Future.wait([
          subscription.cancel(),
          manager.dispose(forceStop: true),
        ]),
      ),
    );

    return manager.state;
  }

  bool supportsPause() => _manager.supportsPause;

  FfmpegTask enqueueRequest(FfmpegTaskRequest request) {
    return _manager.enqueueRequest(request);
  }

  FfmpegTask enqueueSimpleTask({
    required String inputPath,
    required String outputFilepath,
    List<CliArg> args = const [],
    String? ffmpegPath,
    String? label,
  }) {
    return enqueueRequest(
      FfmpegTaskRequest(
        label: _normalizedOrNull(label),
        command: FfmpegCommand.simple(
          ffmpegPath: _normalizedOrNull(ffmpegPath),
          inputs: [FfmpegInput.asset(inputPath)],
          args: args,
          outputFilepath: outputFilepath,
        ),
      ),
    );
  }

  FfmpegTask restartTask(String id) => _manager.startTask(id);

  Future<FfmpegTask> pauseTask(String id) => _manager.pauseTask(id);

  Future<FfmpegTask> resumeTask(String id) => _manager.resumeTask(id);

  Future<FfmpegStopResult> stopTask(String id, {bool force = false}) {
    return _manager.stopTask(id, force: force);
  }

  Future<bool> removeTask(String id, {bool forceStop = false}) {
    return _manager.removeTask(id, forceStop: forceStop);
  }

  void clearFinishedTasks() => _manager.clearFinishedTasks();

  void setMaxConcurrentTasks(int value) {
    ref.read(appSettingsProvider.notifier).updateMaxConcurrentTasks(value);
  }

  String? _normalizedOrNull(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return normalized;
  }
}
