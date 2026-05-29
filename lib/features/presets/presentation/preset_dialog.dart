import 'package:fflow/features/presets/application/preset_categories_provider.dart';
import 'package:fflow/features/presets/data/presets_repository.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresetDialog extends HookConsumerWidget {
  const PresetDialog({super.key, this.preset});

  Future<Preset?> show(BuildContext context) {
    return showDialog<Preset>(
      context: context,
      builder: (context) => PresetDialog(preset: preset),
    );
  }

  final Preset? preset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = preset != null;
    final nameController = useTextEditingController(text: preset?.name ?? '');
    final descriptionController = useTextEditingController(
      text: preset?.description ?? '',
    );
    final argumentsController = useTextEditingController(
      text: preset?.ffmpegArguments ?? '',
    );
    final selectedCategory = useValueNotifier<PresetCategory?>(null);

    return AlertDialog(
      title: Text(isEditing ? 'Edit Preset' : 'New Preset'),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const Gap(16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 2,
              ),
              const Gap(16),
              Consumer(
                builder: (context, ref, child) {
                  final categories = ref.watch(presetCategoriesProvider).value;
                  return DropdownButtonFormField<PresetCategory>(
                    initialValue: selectedCategory.value,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                    ),
                    items: categories?.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        selectedCategory.value = value;
                      }
                    },
                  );
                },
              ),
              const Gap(16),
              TextField(
                controller: argumentsController,
                decoration: const InputDecoration(
                  labelText: 'FFmpeg Arguments',
                ),
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () async {
            final name = nameController.text.trim();
            final description = descriptionController.text.trim();
            final arguments = argumentsController.text.trim();

            if (name.isEmpty || arguments.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Name and FFmpeg arguments cannot be empty.'),
                ),
              );
              // context.notification.showError(
              //   message: 'Name and FFmpeg arguments cannot be empty.',
              // );
              return;
            }

            final newPreset = Preset(
              name: name,
              description: description,
              category: selectedCategory.value,
              ffmpegArguments: arguments,
              isFavorite: preset?.isFavorite ?? false,
              createdAt: preset?.createdAt,
            );

            if (isEditing) {
              await ref.read(presetsRepositoryProvider).update(newPreset);
            } else {
              await ref.read(presetsRepositoryProvider).insert(newPreset);
            }

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: Text(isEditing ? 'Save' : 'Create'),
        ),
      ],
    );
  }
}
