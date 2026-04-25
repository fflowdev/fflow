import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/presets/data/presets_repository.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/presentation/preset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresetCard extends ConsumerWidget {
  const PresetCard({
    super.key,
    required this.preset,
    this.isListView = false,
  });

  final Preset preset;
  final bool isListView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryColor = context.theme.primaryColor;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header with Icon
          Container(
            height: isListView ? 80 : 120,
            width: double.infinity,
            color: categoryColor,
            child: Stack(
              children: [
                if (preset.category != null)
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        preset.category!.name.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Center(
                  child: Icon(
                    Icons.abc,
                    size: isListView ? 32 : 48,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          preset.name,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem<void>(
                            child: const Row(
                              children: [
                                Icon(Icons.edit_outlined, size: 20),
                                Gap(12),
                                Text('Edit'),
                              ],
                            ),
                            onTap: () async {
                              await showDialog<void>(
                                context: context,
                                builder: (context) =>
                                    PresetDialog(preset: preset),
                              );
                            },
                          ),
                          PopupMenuItem<void>(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: context.colorScheme.error,
                                ),
                                const Gap(12),
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: context.colorScheme.error,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              await ref
                                  .read(presetsRepositoryProvider)
                                  .delete(preset);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(8),
                  Text(
                    preset.description,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                    maxLines: isListView ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Command Preview
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      preset.ffmpegCommand,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                        fontSize: 11,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(12),
                  // Actions
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => PresetDialog(preset: preset),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined, size: 16),
                        label: const Text('Edit'),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.content_copy_outlined, size: 20),
                        tooltip: 'Copy command',
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: preset.ffmpegCommand),
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Command copied to clipboard'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 20),
                        tooltip: 'Delete preset',
                        onPressed: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Delete Preset'),
                              content: Text(
                                'Are you sure you want to delete "${preset.name}"?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancel'),
                                ),
                                FilledButton(
                                  onPressed: () async {
                                    await ref
                                        .read(presetsRepositoryProvider)
                                        .delete(preset);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
