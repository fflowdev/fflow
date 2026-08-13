import 'dart:async';
import 'dart:io';
import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_parser.dart';
import 'package:fflow/core/widgets/dialog_form_fields.dart';
import 'package:fflow/core/widgets/scrollable_dialog.dart';
import 'package:fflow/features/presets/application/presets_query_provider.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/presets_query_arguments.dart';
import 'package:fflow/features/settings/application/ffmpeg_settings_provider.dart';
import 'package:fflow/features/settings/application/output_preferences_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class CreateQueueTaskFormData {
  const CreateQueueTaskFormData({
    required this.label,
    required this.ffmpegPath,
    required this.preset,
    required this.additionalArgs,
    required this.overwriteOutput,
    required this.inputPath,
    required this.outputDirectory,
    required this.outputFileName,
  });

  final String label;
  final String ffmpegPath;
  final Preset? preset;
  final String additionalArgs;
  final bool overwriteOutput;
  final String inputPath;
  final String outputDirectory;
  final String outputFileName;
}

sealed class _PresetsDropdownValue {
  const _PresetsDropdownValue();
}

class _PresetDropdownValue extends _PresetsDropdownValue {
  const _PresetDropdownValue(this.preset);

  final Preset preset;
}

class _NoPresetDropdownValue extends _PresetsDropdownValue {
  const _NoPresetDropdownValue();
}

class CreateQueueTaskDialog extends HookConsumerWidget {
  const CreateQueueTaskDialog({super.key});

  Future<CreateQueueTaskFormData?> show(BuildContext context) {
    return showDialog<CreateQueueTaskFormData>(
      context: context,
      builder: (_) => this,
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final labelController = useTextEditingController();
    final ffmpegPathController = useTextEditingController(
      text: ref.read(ffmpegSettingsProvider).ffmpegExecutablePath,
    );
    final presetRef = useRef<Preset?>(null);
    final inputPathController = useTextEditingController();
    final outputDirectoryController = useTextEditingController(
      text: ref.read(outputPreferencesProvider).outputDirectoryPath,
    );
    final outputFileNameController = useTextEditingController(
      text: 'output.mp4',
    );
    final extraArgsController = useTextEditingController();
    final overwriteOutput = useState(true);

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

    void onPresetSelected(_PresetsDropdownValue? value) {
      if (value is _PresetDropdownValue) {
        presetRef.value = value.preset;
      } else {
        presetRef.value = null;
      }
    }

    void submit() {
      final valid = formKey.currentState?.validate() ?? false;
      if (!valid) {
        return;
      }

      try {
        final formData = CreateQueueTaskFormData(
          label: labelController.text.trim(),
          ffmpegPath: ffmpegPathController.text.trim(),
          preset: presetRef.value,
          inputPath: inputPathController.text.trim(),
          outputDirectory: outputDirectoryController.text.trim(),
          outputFileName: outputFileNameController.text.trim(),
          additionalArgs: extraArgsController.text.trim(),
          overwriteOutput: overwriteOutput.value,
        );

        Navigator.of(context).pop(formData);
      } on Exception catch (error) {
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
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
                      labelText: 'FFmpeg executable path',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.folder_open),
                        onPressed: pickFfmpegExecutable,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'FFmpeg executable path is required.';
                      }
                      return null;
                    },
                  ),
                  _PresetsDropdownMenu(onSelected: onPresetSelected),
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton.icon(
          onPressed: submit,
          icon: const Icon(Icons.queue),
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

class _PresetsDropdownMenu extends ConsumerWidget {
  const _PresetsDropdownMenu({required this.onSelected});

  final void Function(_PresetsDropdownValue? value) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presets = ref.watch(
      presetsQueryProvider(const PresetsQueryArguments()),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<_PresetsDropdownValue?>(
          width: constraints.maxWidth,
          initialSelection: const _NoPresetDropdownValue(),
          label: const Text('Preset (Optional)'),
          onSelected: onSelected,
          dropdownMenuEntries: switch (presets) {
            AsyncLoading() => const [
              DropdownMenuEntry(
                label: 'Loading presets...',
                value: null,
                enabled: false,
              ),
            ],
            AsyncError(:final error) => [
              DropdownMenuEntry(
                label: 'Error loading presets: $error',
                value: null,
                enabled: false,
              ),
            ],
            AsyncData(:final value) =>
              value.isEmpty
                  ? [
                      const DropdownMenuEntry(
                        label: 'No presets available',
                        value: null,
                        enabled: false,
                      ),
                    ]
                  : value
                        .map(
                          (preset) => DropdownMenuEntry(
                            label: preset.name,
                            value: _PresetDropdownValue(preset),
                          ),
                        )
                        .toList(),
          },
        );
      },
    );
  }
}
