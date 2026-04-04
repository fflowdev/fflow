import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/extension/iterable_extension.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/home/presentation/home_shell_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeShellScaffold(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        children: [
          _ListTileGroup(
            name: 'Appearance',
            listTiles: [
              _ListTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Adjust the interface preference',
                trailing: Consumer(
                  builder: (context, ref, child) {
                    final currentThemeMode = ref.watch(
                      appSettingsProvider.select(
                        (state) => state.themeSettings.themeMode,
                      ),
                    );
                    return SegmentedButton(
                      showSelectedIcon: false,
                      segments: ThemeMode.values
                          .map(
                            (e) => ButtonSegment(
                              value: e,
                              label: switch (e) {
                                ThemeMode.system => const Text('System'),
                                ThemeMode.light => const Text('Light'),
                                ThemeMode.dark => const Text('Dark'),
                              },
                            ),
                          )
                          .toList(),
                      onSelectionChanged: (newSelection) {
                        if (newSelection.isEmpty) return;
                        ref
                            .read(appSettingsProvider.notifier)
                            .updateThemeMode(newSelection.first);
                      },
                      selected: {
                        currentThemeMode,
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ListTile {
  const _ListTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
}

class _ListTileBuilder extends StatelessWidget {
  const _ListTileBuilder({
    required this.listTile,
    required this.borderRadius,
  });

  final _ListTile listTile;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainer,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: listTile.onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(listTile.icon, size: 20),
                ),
              ),
              const Gap(16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listTile.title,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  if (listTile.subtitle != null)
                    Text(
                      listTile.subtitle!,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
              const Spacer(),
              ?listTile.trailing,
            ],
          ),
        ),
      ),
    );
  }
}

class _ListTileGroup extends StatelessWidget {
  const _ListTileGroup({this.name, required this.listTiles});

  final String? name;
  final List<_ListTile> listTiles;

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      height: 1,
      thickness: 1,
      color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
    );
    const radius = Radius.circular(12);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              name!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),

        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: listTiles.length > 1
                ? listTiles
                      .map<Widget>((tile) {
                        final isFirst = tile == listTiles.first;
                        final isLast = tile == listTiles.last;
                        final borderRadius = BorderRadius.vertical(
                          top: isFirst ? radius : Radius.zero,
                          bottom: isLast ? radius : Radius.zero,
                        );
                        return _ListTileBuilder(
                          listTile: tile,
                          borderRadius: borderRadius,
                        );
                      })
                      .joinWith(divider)
                      .toList()
                : listTiles
                      .map(
                        (tile) => _ListTileBuilder(
                          listTile: tile,
                          borderRadius: const BorderRadius.all(radius),
                        ),
                      )
                      .toList(),
          ),
        ),
      ],
    );
  }
}
