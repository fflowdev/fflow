import 'dart:async';
import 'dart:io';
import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_parser.dart';
import 'package:fflow/core/widgets/dialog_form_fields.dart';
import 'package:fflow/core/widgets/scrollable_dialog.dart';
import 'package:fflow/features/queue/application/ffmpeg_queue_controller.dart';
import 'package:fflow/features/settings/application/ffmpeg_settings_provider.dart';
import 'package:fflow/features/settings/application/output_preferences_provider.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class CreateQueueTaskDialog extends HookConsumerWidget {
  const CreateQueueTaskDialog({super.key});

  Future<void> show(BuildContext context) {
    return showDialog<void>(context: context, builder: (_) => this);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final labelController = useTextEditingController();
    final ffmpegPathController = useTextEditingController(
      text: ref.read(ffmpegSettingsProvider).ffmpegExecutablePath,
    );
    final inputPathController = useTextEditingController();
    final outputDirectoryController = useTextEditingController(
      text: ref.read(outputPreferencesProvider).outputDirectoryPath,
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
        outputFileNameController.text = '${basenameWithoutExtension(path)}.mp4';
      }
      if (labelController.text.trim().isEmpty) {
        labelController.text = basenameWithoutExtension(path);
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

        final outputFilepath = join(
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
      } on Exception catch (error) {
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      } finally {
        isSubmitting.value = false;
      }
    }

    return ScrollableDialog(
      title: const Text('New Queue Task'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            Flexible(
              child: _Fields(
                title: const Text('Task'),
                children: [
                  TextFormField(
                    controller: labelController,
                    decoration: const InputDecoration(
                      labelText: 'Task label (Optional)',
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: _Fields(
                title: const Text('FFmpeg'),
                children: [
                  TextFormField(
                    controller: ffmpegPathController,
                    decoration: InputDecoration(
                      labelText: 'FFmpeg executable path (Optional)',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.folder_open),
                        onPressed: pickFfmpegExecutable,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: extraArgsController,
                    decoration: const InputDecoration(
                      labelText: 'Additional FFmpeg arguments (Optional)',
                    ),
                    validator: (value) {
                      final args = const FfmpegCliArgumentParser()
                          .parse(value ?? '')
                          .toList();
                      for (final arg in args) {
                        if (arg.name == 'progress' && arg.value != 'pipe:1') {
                          return '''Do not override `-progress`. Queue tracking manages it.''';
                        }
                      }
                      return null;
                    },
                  ),
                  SwitchListTile(
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
            Flexible(
              child: _Fields(
                title: const Text('Inputs'),
                children: [
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
                ],
              ),
            ),
            Flexible(
              child: _Fields(
                title: const Text('Output'),
                children: [
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
                ],
              ),
            ),
          ],
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

class _Fields extends HookWidget {
  const _Fields({required this.title, required this.children});

  final Widget title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return DialogFormFields<void>(
      title: title,
      validator: (_) {
        final validated = formKey.currentState?.validate() ?? false;
        return validated ? null : 'Please fix errors in this section.';
      },
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: children,
        ),
      ),
    );
  }
}
