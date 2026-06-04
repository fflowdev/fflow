import 'package:fflow/core/router/presentation/shell_route_scaffold.dart';
import 'package:fflow/features/presets/application/preset_categories_provider.dart';
import 'package:fflow/features/presets/application/preset_category_repository_provider.dart';
import 'package:fflow/features/presets/application/presets_query_arguments_provider.dart';
import 'package:fflow/features/presets/application/presets_query_provider.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:fflow/features/presets/presentation/preset_dialog.dart';
import 'package:fflow/features/presets/presentation/preset_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresetsPage extends HookConsumerWidget {
  const PresetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShellRouteScaffold(
      title: 'Preset Library',
      titleBarActions: [
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Implement import
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Import feature coming soon'),
              ),
            );
          },
          icon: const Icon(Icons.file_download_outlined),
          label: const Text('Import'),
        ),
        const Gap(12),
        FilledButton.icon(
          onPressed: () async {
            await const PresetDialog().show(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('New Preset'),
        ),
        const Gap(24),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
            child: _SearchAndViewToggle(),
          ),
          // Filter Chips
          const _FliterChips(),
          // Presets Grid/List
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final args = ref.watch(presetsQueryArgumentsProvider);
                final presets = ref.watch(presetsQueryProvider(args));
                return switch (presets) {
                  AsyncLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  AsyncError(:final error) => Center(
                    child: Text('Error: $error'),
                  ),
                  AsyncData(:final value) => _ListView(presets: value.toList()),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchAndViewToggle extends HookConsumerWidget {
  const _SearchAndViewToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search presets...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      onChanged: ref
          .read(presetsQueryArgumentsProvider.notifier)
          .updateQueryName,
    );
  }
}

class _FliterChips extends HookConsumerWidget {
  const _FliterChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(
      presetsQueryArgumentsProvider.select((args) => args.category),
    );
    final categories = ref.watch(presetCategoriesProvider).value;

    Future<void> deleteCategory(PresetCategory category) async {
      final confirm = await _PresetCategoryDeleteDialog(
        categoryName: category.name,
      ).show(context);
      if (confirm ?? false) {
        await ref.read(presetCategoryRepositoryProvider).delete(category);
      }
    }

    Future<void> addCategory() async {
      final result = await const _PresetCategoryAddDialog().show(context);
      if (result == null) return;

      final (name, description) = result;
      if (name.trim().isEmpty) return;

      await ref
          .read(presetCategoryRepositoryProvider)
          .insert(
            PresetCategory(name.trim(), description: description?.trim()),
          );
    }

    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children:
            [null, ...?categories].map<Widget>((category) {
              final allCategory = category == null;
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(
                    allCategory ? 'All' : category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: allCategory
                      ? null
                      : () => deleteCategory(category),
                  selected: isSelected,
                  onSelected: (_) => ref
                      .read(presetsQueryArgumentsProvider.notifier)
                      .updateCategory(category),
                ),
              );
            }).toList() +
            [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: addCategory,
              ),
            ],
      ),
    );
  }
}

class _ListView extends ConsumerWidget {
  const _ListView({required this.presets});

  final List<Preset> presets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: presets.length,
      separatorBuilder: (context, index) => const Gap(12),
      itemBuilder: (context, index) {
        return PresetListItem(preset: presets[index]);
      },
    );
  }
}

class _PresetCategoryDeleteDialog extends HookConsumerWidget {
  const _PresetCategoryDeleteDialog({required this.categoryName});

  final String categoryName;

  Future<bool?> show(BuildContext context) => showDialog<bool>(
    context: context,
    builder: (context) => _PresetCategoryDeleteDialog(
      categoryName: categoryName,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void cancel() => Navigator.of(context).pop(false);
    void confirm() => Navigator.of(context).pop(true);

    return AlertDialog(
      title: const Text('Delete Category'),
      content: Text(
        '''Are you sure you want to delete the category "$categoryName"? This will not delete the presets in this category, but they will be uncategorized.''',
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: confirm,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

class _PresetCategoryAddDialog extends HookConsumerWidget {
  const _PresetCategoryAddDialog();

  /// returns (name, description)
  Future<(String, String?)?> show(BuildContext context) =>
      showDialog<(String, String?)>(
        context: context,
        builder: (context) => const _PresetCategoryAddDialog(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);

    void cancel() => Navigator.of(context).pop();

    void submit() {
      final valid = formKey.currentState?.validate() ?? false;
      if (!valid) return;
      Navigator.of(context).pop(
        (
          nameController.text,
          descriptionController.text.isEmpty
              ? null
              : descriptionController.text,
        ),
      );
    }

    return AlertDialog(
      title: const Text('New Category'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Category Name',
                ),
                maxLength: 30,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Category name cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            const Gap(12),
            Flexible(
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description (optional)',
                ),
                maxLength: 100,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: submit,
          child: const Text('Create'),
        ),
      ],
    );
  }
}
