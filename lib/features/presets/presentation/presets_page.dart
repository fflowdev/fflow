import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/home_shell/presentation/widgets/home_shell_scaffold.dart';
import 'package:fflow/features/presets/application/preset_view_mode_provider.dart';
import 'package:fflow/features/presets/application/presets_provider.dart';
import 'package:fflow/features/presets/application/presets_query_arguments_provider.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/preset_view_mode.dart';
import 'package:fflow/features/presets/presentation/preset_dialog.dart';
import 'package:fflow/features/presets/presentation/widgets/preset_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresetsPage extends HookConsumerWidget {
  const PresetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeShellScaffold(
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
            await showDialog<void>(
              context: context,
              builder: (context) => const PresetDialog(),
            );
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
            padding: EdgeInsets.all(24),
            child: _SearchAndViewToggle(),
          ),
          // Filter Chips
          const _FliterChips(),
          // Presets Grid/List
          Consumer(
            builder: (context, ref, child) {
              final viewMode = ref.watch(presetViewModeProvider);
              final args = ref.watch(presetsQueryArgumentsProvider);
              final presets = ref.watch(watchPresetsProvider(args));
              return switch (presets) {
                AsyncLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                AsyncError(:final error) => Center(
                  child: Text('Error: $error'),
                ),
                AsyncData(:final value) => Expanded(
                  child: viewMode == PresetViewMode.grid
                      ? _GridView(presets: value.toList())
                      : _ListView(presets: value.toList()),
                ),
              };
            },
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
    return Row(
      children: [
        Expanded(
          child: TextField(
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
          ),
        ),
        const Gap(12),
        Consumer(
          builder: (context, ref, child) {
            final viewMode = ref.watch(presetViewModeProvider);
            return IconButton.filledTonal(
              onPressed: ref.read(presetViewModeProvider.notifier).toggle,
              icon: Icon(
                viewMode == PresetViewMode.grid
                    ? Icons.grid_view
                    : Icons.view_list,
              ),
              tooltip: viewMode == PresetViewMode.grid
                  ? 'Switch to list view'
                  : 'Switch to grid view',
            );
          },
        ),
      ],
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
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          FilterChip(
            label: const Text('All'),
            selected: selectedCategory == null,
            onSelected: (_) => ref
                .read(presetsQueryArgumentsProvider.notifier)
                .updateCategory(null),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

class _GridView extends ConsumerWidget {
  const _GridView({required this.presets});

  final List<Preset> presets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: presets.length,
      itemBuilder: (context, index) {
        return PresetCard(preset: presets[index]);
      },
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
        return PresetCard(preset: presets[index], isListView: true);
      },
    );
  }
}
