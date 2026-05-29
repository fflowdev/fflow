import 'package:fflow/features/presets/domain/preset.dart';
import 'package:flutter/material.dart';

class PresetListItem extends StatelessWidget {
  const PresetListItem({super.key, required this.preset});

  final Preset preset;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Theme.of(context).colorScheme.surfaceContainerLow,
      hoverColor: Theme.of(context).colorScheme.surfaceContainer,
      onTap: () {},
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
      subtitle: Text(
        preset.ffmpegArguments,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
