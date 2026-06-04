import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_parser.dart';
import 'package:fflow/features/presets/application/presets_repository.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/presentation/preset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresetListItem extends ConsumerWidget {
  const PresetListItem({super.key, required this.preset});

  final Preset preset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> edit() async {
      final editedPreset = await PresetDialog(
        preset: preset,
      ).show(context);
      if (editedPreset == null) return;

      await ref.read(presetsRepositoryProvider).update(editedPreset);
    }

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Theme.of(context).colorScheme.surfaceContainerLow,
      hoverColor: Theme.of(context).colorScheme.surfaceContainer,
      onTap: () {
        // TODO(Noo6): Create Task
      },
      title: RichText(
        text: TextSpan(
          text: preset.name,
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            if (preset.category != null)
              TextSpan(
                text: '  ${preset.category!.name}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
      subtitle: Row(
        spacing: 8,
        children: const FfmpegCliArgumentParser()
            .parse(preset.ffmpegArguments)
            .map(
              (arg) => Badge(
                label: Text(
                  arg.name + (arg.value != null ? ': ${arg.value}' : ''),
                ),
              ),
            )
            .toList(),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: edit,
      ),
    );
  }
}
