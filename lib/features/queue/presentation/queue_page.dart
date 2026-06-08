import 'dart:async';
import 'dart:io';

import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_parser.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_queue_manager.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_task.dart';
import 'package:fflow/core/router/presentation/shell_route_scaffold.dart';
import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/queue/application/ffmpeg_queue_controller.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _kBottomBarHeight = 36.0;

class QueuePage extends ConsumerWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ffmpegQueueControllerProvider);
    final controller = ref.read(ffmpegQueueControllerProvider.notifier);

    return ShellRouteScaffold(
      title: 'Queue',
      titleBarActions: [
        OutlinedButton.icon(
          onPressed: state.tasks.any((task) => task.status.isTerminal)
              ? controller.clearFinishedTasks
              : null,
          icon: const Icon(Icons.auto_delete_outlined),
          label: const Text('Clear Finished'),
        ),
        const Gap(12),
        FilledButton.icon(
          onPressed: () async {
            await const _CreateQueueTaskDialog().show(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('New Task'),
        ),
        const Gap(24),
      ],
      body: Column(
        children: [
          Expanded(
            child: SelectionArea(
              child: state.tasks.isEmpty
                  ? const _EmptyQueueState()
                  : ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: 16,
                      ),
                      itemCount: state.tasks.length,
                      separatorBuilder: (_, _) => const Gap(16),
                      itemBuilder: (context, index) {
                        return _QueueTaskCard(task: state.tasks[index]);
                      },
                    ),
            ),
          ),
          _QueueBottomBar(
            state: state,
            supportsPause: controller.supportsPause(),
          ),
        ],
      ),
    );
  }
}

class _QueueBottomBar extends StatelessWidget {
  const _QueueBottomBar({
    required this.state,
    required this.supportsPause,
  });

  final FfmpegQueueState state;
  final bool supportsPause;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.outlineVariant,
          ),
        ),
      ),
      child: SizedBox(
        height: _kBottomBarHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Spacer(),
              Flexible(
                flex: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    _QueueBottomMetric(
                      value: state.activeTaskCount,
                      icon: Icons.play_circle_outline,
                      color: context.colorScheme.primary,
                    ),
                    _QueueBottomMetric(
                      value: state.queuedTaskCount,
                      icon: Icons.schedule_outlined,
                      color: context.colorScheme.tertiary,
                    ),
                    _QueueBottomMetric(
                      value: state.completedTaskCount,
                      icon: Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    _QueueBottomMetric(
                      value: state.failedTaskCount,
                      icon: Icons.error_outline,
                      color: context.colorScheme.error,
                    ),
                    _QueueBottomMetric(
                      value: state.canceledTaskCount,
                      icon: Icons.cancel_outlined,
                      color: context.colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QueueBottomMetric extends StatelessWidget {
  const _QueueBottomMetric({
    required this.value,
    required this.icon,
    required this.color,
  });

  final int value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(icon, color: color, size: 16),
        Flexible(
          child: Text(
            value.toString(),
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}

class _QueueTaskCard extends ConsumerWidget {
  const _QueueTaskCard({required this.task});

  final FfmpegTask task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(ffmpegQueueControllerProvider.notifier);
    final statusStyle = _taskStatusStyle(context, task.status);
    final showRemoveButton =
        task.status == FfmpegTaskStatus.queued || task.status.isTerminal;
    final details = _buildDetailItems(task);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.label ??
                            _outputFilename(task.command.outputFilepath),
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        task.command.outputFilepath,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                Chip(
                  avatar: Icon(
                    statusStyle.icon,
                    size: 18,
                    color: statusStyle.foregroundColor,
                  ),
                  backgroundColor: statusStyle.backgroundColor,
                  side: BorderSide.none,
                  label: Text(
                    statusStyle.label,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: statusStyle.foregroundColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final detail in details)
                  _DetailChip(
                    label: detail.$1,
                    value: detail.$2,
                  ),
              ],
            ),
            if (task.progress != null || task.status.reservesExecutionSlot) ...[
              const Gap(16),
              _TaskProgressSection(task: task),
            ],
            const Gap(16),
            _TaskCommandSection(task: task),
            if (task.lastStdoutLine != null) ...[
              const Gap(12),
              _TaskLineSection(
                title: 'Latest stdout',
                content: task.lastStdoutLine!,
              ),
            ],
            if (task.lastStderrLine != null) ...[
              const Gap(12),
              _TaskLineSection(
                title: 'Latest stderr',
                content: task.lastStderrLine!,
                tone: _TaskLineTone.error,
              ),
            ],
            if (task.errorMessage != null) ...[
              const Gap(12),
              _TaskLineSection(
                title: 'Error',
                content: task.errorMessage!,
                tone: _TaskLineTone.error,
              ),
            ],
            const Gap(16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (task.status.isTerminal)
                  OutlinedButton.icon(
                    onPressed: () => _runGuarded(
                      context,
                      () async => controller.restartTask(task.id),
                    ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                if (task.canPause)
                  OutlinedButton.icon(
                    onPressed: () => _runGuarded(
                      context,
                      () => controller.pauseTask(task.id),
                    ),
                    icon: const Icon(Icons.pause_circle_outline),
                    label: const Text('Pause'),
                  ),
                if (task.canResume)
                  OutlinedButton.icon(
                    onPressed: () => _runGuarded(
                      context,
                      () => controller.resumeTask(task.id),
                    ),
                    icon: const Icon(Icons.play_circle_outline),
                    label: const Text('Resume'),
                  ),
                if (task.canStop)
                  FilledButton.tonalIcon(
                    onPressed: task.status == FfmpegTaskStatus.stopping
                        ? null
                        : () => _runGuarded(
                            context,
                            () => controller.stopTask(task.id),
                          ),
                    icon: const Icon(Icons.stop_circle_outlined),
                    label: Text(
                      switch (task.status) {
                        FfmpegTaskStatus.queued => 'Cancel',
                        FfmpegTaskStatus.stopping => 'Stopping',
                        _ => 'Stop',
                      },
                    ),
                  ),
                if (showRemoveButton)
                  TextButton.icon(
                    onPressed: () => _runGuarded(
                      context,
                      () => controller.removeTask(task.id),
                    ),
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Remove'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<(String, String)> _buildDetailItems(FfmpegTask task) {
    final items = <(String, String)>[
      ('Attempt', task.attempt.toString()),
      ('Queued', _formatDateTime(task.queuedAt)),
      ('Output', _outputFilename(task.command.outputFilepath)),
    ];

    final input = task.command.inputs.isEmpty
        ? null
        : _describeInput(task.command.inputs.first);
    if (input != null) {
      items.add(('Input', input));
    }
    if (task.startedAt != null) {
      items.add(('Started', _formatDateTime(task.startedAt!)));
    }
    if (task.endedAt != null) {
      items.add(('Ended', _formatDateTime(task.endedAt!)));
    }
    if (task.runResult != null) {
      final runResult = task.runResult!;
      items
        ..add(('Exit code', runResult.exitCode.toString()))
        ..add(('Duration', _formatDuration(runResult.duration)));
    }
    if (task.stopResult != null) {
      items.add(('Stop result', _formatStopResult(task.stopResult!)));
    }

    return items;
  }
}

class _TaskProgressSection extends StatelessWidget {
  const _TaskProgressSection({required this.task});

  final FfmpegTask task;

  @override
  Widget build(BuildContext context) {
    final progress = task.progress;
    final metrics = [
      if (progress?.outTime != null)
        ('Time', _formatDuration(progress!.outTime!)),
      if (progress?.frame != null) ('Frame', progress!.frame.toString()),
      if (progress?.fps != null) ('FPS', progress!.fps!.toStringAsFixed(1)),
      if (progress?.speed != null) ('Speed', progress!.speed!),
      if (progress?.bitrate != null) ('Bitrate', progress!.bitrate!),
      if (progress?.totalSize != null)
        ('Size', _formatBytes(progress!.totalSize!)),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: task.status.isTerminal ? 1 : null,
              borderRadius: BorderRadius.circular(999),
              minHeight: 8,
            ),
            if (metrics.isNotEmpty) ...[
              const Gap(12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final metric in metrics)
                    _DetailChip(label: metric.$1, value: metric.$2),
                ],
              ),
            ],
            if (progress?.progress != null) ...[
              const Gap(10),
              Text(
                'Progress state: ${progress!.progress}',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TaskCommandSection extends StatelessWidget {
  const _TaskCommandSection({required this.task});

  final FfmpegTask task;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              'Command',
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              task.command.expectedCliInput().trim(),
              style: context.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _TaskLineTone { neutral, error }

class _TaskLineSection extends StatelessWidget {
  const _TaskLineSection({
    required this.title,
    required this.content,
    this.tone = _TaskLineTone.neutral,
  });

  final String title;
  final String content;
  final _TaskLineTone tone;

  @override
  Widget build(BuildContext context) {
    final isError = tone == _TaskLineTone.error;
    final backgroundColor = isError
        ? context.colorScheme.errorContainer
        : context.colorScheme.surface;
    final foregroundColor = isError
        ? context.colorScheme.onErrorContainer
        : context.colorScheme.onSurface;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isError
              ? context.colorScheme.error.withValues(alpha: 0.3)
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              title,
              style: context.textTheme.labelLarge?.copyWith(
                color: foregroundColor,
              ),
            ),
            Text(
              content,
              style: context.textTheme.bodySmall?.copyWith(
                color: foregroundColor,
                fontFamily: 'monospace',
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  const _DetailChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: RichText(
          text: TextSpan(
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
            children: [
              TextSpan(
                text: '$label: ',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              TextSpan(text: value),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyQueueState extends StatelessWidget {
  const _EmptyQueueState();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: context.colorScheme.outlineVariant,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Icon(
                          Icons.video_settings_outlined,
                          size: 40,
                          color: context.colorScheme.primary,
                        ),
                        Text(
                          'No FFmpeg tasks yet',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Create a task to enqueue an FFmpeg command. The '
                          'queue will start tasks automatically and keep '
                          'completed jobs here for review.',
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                        FilledButton.icon(
                          onPressed: () async {
                            await const _CreateQueueTaskDialog().show(context);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Create Task'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CreateQueueTaskDialog extends HookConsumerWidget {
  const _CreateQueueTaskDialog();

  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (_) => const _CreateQueueTaskDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final labelController = useTextEditingController();
    final ffmpegPathController = useTextEditingController(
      text: appSettings.ffmpegPath ?? '',
    );
    final inputPathController = useTextEditingController();
    final outputDirectoryController = useTextEditingController(
      text: appSettings.outputDiretoryPath ?? '',
    );
    final outputFileNameController = useTextEditingController(
      text: 'output.mp4',
    );
    final extraArgsController = useTextEditingController();
    final overwriteOutput = useState(true);
    final isSubmitting = useState(false);

    Future<void> pickFfmpegExecutable() async {
      final result = await FilePicker.pickFiles(
        allowedExtensions: Platform.isWindows ? ['exe'] : null,
        type: Platform.isWindows ? FileType.custom : FileType.any,
      );
      final path = result?.files.single.path;
      if (path != null) {
        ffmpegPathController.text = path;
      }
    }

    Future<void> pickInputFile() async {
      final result = await FilePicker.pickFiles();
      final path = result?.files.single.path;
      if (path == null) {
        return;
      }

      inputPathController.text = path;
      if (outputFileNameController.text.trim() == 'output.mp4') {
        outputFileNameController.text =
            '${_basenameWithoutExtension(path)}.mp4';
      }
      if (labelController.text.trim().isEmpty) {
        labelController.text = _basenameWithoutExtension(path);
      }
    }

    Future<void> pickOutputDirectory() async {
      final path = await FilePicker.getDirectoryPath();
      if (path != null) {
        outputDirectoryController.text = path;
      }
    }

    Future<void> submit() async {
      final valid = formKey.currentState?.validate() ?? false;
      if (!valid || isSubmitting.value) {
        return;
      }

      isSubmitting.value = true;
      try {
        final args = const FfmpegCliArgumentParser()
            .parse(extraArgsController.text)
            .toList(growable: true);
        if (overwriteOutput.value && args.every((arg) => arg.name != 'y')) {
          args.insert(0, const CliArg(name: 'y'));
        }

        final outputFilepath = _joinOutputPath(
          outputDirectoryController.text.trim(),
          outputFileNameController.text.trim(),
        );

        ref
            .read(ffmpegQueueControllerProvider.notifier)
            .enqueueSimpleTask(
              ffmpegPath: ffmpegPathController.text,
              inputPath: inputPathController.text.trim(),
              outputFilepath: outputFilepath,
              label: labelController.text,
              args: args,
            );

        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop();
      } on Object catch (error) {
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_formatError(error))),
        );
      } finally {
        isSubmitting.value = false;
      }
    }

    return AlertDialog(
      title: const Text('New Queue Task'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Text(
                  'Build an `FfmpegCommand.simple` task. The queue manager '
                  'will add progress tracking automatically.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
                TextFormField(
                  controller: labelController,
                  decoration: const InputDecoration(
                    labelText: 'Task label',
                    hintText: 'Optional',
                  ),
                ),
                TextFormField(
                  controller: ffmpegPathController,
                  decoration: InputDecoration(
                    labelText: 'FFmpeg executable path',
                    hintText: 'Optional, falls back to PATH',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.folder_open),
                      onPressed: pickFfmpegExecutable,
                    ),
                  ),
                ),
                TextFormField(
                  controller: inputPathController,
                  decoration: InputDecoration(
                    labelText: 'Input file',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: pickInputFile,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input file is required.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: outputDirectoryController,
                  decoration: InputDecoration(
                    labelText: 'Output directory',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.folder_open),
                      onPressed: pickOutputDirectory,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Output directory is required.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: outputFileNameController,
                  decoration: const InputDecoration(
                    labelText: 'Output filename',
                    hintText: 'output.mp4',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Output filename is required.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: extraArgsController,
                  decoration: const InputDecoration(
                    labelText: 'Additional FFmpeg arguments',
                    hintText: '-c:v libx264 -preset fast',
                  ),
                  validator: _validateAdditionalArgs,
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Overwrite existing output'),
                  subtitle: const Text(
                    'Adds `-y` when it is not already present.',
                  ),
                  value: overwriteOutput.value,
                  onChanged: (value) {
                    overwriteOutput.value = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: isSubmitting.value
              ? null
              : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton.icon(
          onPressed: isSubmitting.value ? null : submit,
          icon: isSubmitting.value
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.queue),
          label: const Text('Enqueue'),
        ),
      ],
    );
  }
}

class _TaskStatusStyle {
  const _TaskStatusStyle({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
}

_TaskStatusStyle _taskStatusStyle(
  BuildContext context,
  FfmpegTaskStatus status,
) {
  return switch (status) {
    FfmpegTaskStatus.queued => _TaskStatusStyle(
      label: 'Queued',
      icon: Icons.schedule_outlined,
      backgroundColor: context.colorScheme.secondaryContainer,
      foregroundColor: context.colorScheme.onSecondaryContainer,
    ),
    FfmpegTaskStatus.running => _TaskStatusStyle(
      label: 'Running',
      icon: Icons.play_circle_outline,
      backgroundColor: context.colorScheme.primaryContainer,
      foregroundColor: context.colorScheme.onPrimaryContainer,
    ),
    FfmpegTaskStatus.paused => _TaskStatusStyle(
      label: 'Paused',
      icon: Icons.pause_circle_outline,
      backgroundColor: context.colorScheme.tertiaryContainer,
      foregroundColor: context.colorScheme.onTertiaryContainer,
    ),
    FfmpegTaskStatus.stopping => _TaskStatusStyle(
      label: 'Stopping',
      icon: Icons.stop_circle_outlined,
      backgroundColor: context.colorScheme.surfaceContainerHighest,
      foregroundColor: context.colorScheme.onSurface,
    ),
    FfmpegTaskStatus.canceled => _TaskStatusStyle(
      label: 'Canceled',
      icon: Icons.cancel_outlined,
      backgroundColor: context.colorScheme.secondaryContainer,
      foregroundColor: context.colorScheme.onSecondaryContainer,
    ),
    FfmpegTaskStatus.succeeded => _TaskStatusStyle(
      label: 'Succeeded',
      icon: Icons.check_circle_outline,
      backgroundColor: Colors.green.withValues(alpha: 0.15),
      foregroundColor: Colors.green.shade800,
    ),
    FfmpegTaskStatus.failed => _TaskStatusStyle(
      label: 'Failed',
      icon: Icons.error_outline,
      backgroundColor: context.colorScheme.errorContainer,
      foregroundColor: context.colorScheme.onErrorContainer,
    ),
  };
}

Future<void> _runGuarded(
  BuildContext context,
  FutureOr<void> Function() action,
) async {
  try {
    await Future.sync(action);
  } on Object catch (error) {
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_formatError(error))),
    );
  }
}

String? _validateAdditionalArgs(String? value) {
  final args = const FfmpegCliArgumentParser().parse(value ?? '').toList();
  for (final arg in args) {
    if (arg.name == 'progress' && arg.value != 'pipe:1') {
      return 'Do not override `-progress`. Queue tracking manages it.';
    }
  }
  return null;
}

String _describeInput(FfmpegInput input) {
  final args = input.args;
  if (args.length >= 2 && args.first == '-i') {
    return args[1];
  }
  return input.toCli();
}

String _outputFilename(String outputFilepath) {
  final normalized = outputFilepath.replaceAll(r'\', '/');
  return normalized.split('/').last;
}

String _basenameWithoutExtension(String path) {
  final filename = _outputFilename(path);
  final dotIndex = filename.lastIndexOf('.');
  if (dotIndex <= 0) {
    return filename;
  }
  return filename.substring(0, dotIndex);
}

String _joinOutputPath(String directoryPath, String fileName) {
  if (directoryPath.endsWith(r'\') || directoryPath.endsWith('/')) {
    return '$directoryPath$fileName';
  }
  return '$directoryPath${Platform.pathSeparator}$fileName';
}

String _formatDateTime(DateTime value) {
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  final second = value.second.toString().padLeft(2, '0');
  return '$year-$month-$day $hour:$minute:$second';
}

String _formatDuration(Duration duration) {
  final totalHours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  final milliseconds = duration.inMilliseconds
      .remainder(1000)
      .toString()
      .padLeft(3, '0');
  return '$totalHours:$minutes:$seconds.$milliseconds';
}

String _formatBytes(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  }
  if (bytes < 1024 * 1024) {
    return '${(bytes / 1024).toStringAsFixed(1)} KB';
  }
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
}

String _formatStopResult(FfmpegStopResult result) {
  return switch (result) {
    FfmpegStopResult.notRunning => 'not running',
    FfmpegStopResult.gracefullyStopped => 'gracefully stopped',
    FfmpegStopResult.terminated => 'terminated',
    FfmpegStopResult.killed => 'killed',
    FfmpegStopResult.failed => 'failed',
  };
}

String _formatError(Object error) {
  final message = error.toString().trim();
  if (message.startsWith('Exception: ')) {
    return message.substring('Exception: '.length);
  }
  return message;
}
