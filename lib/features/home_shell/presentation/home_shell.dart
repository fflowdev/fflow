import 'package:fflow/core/router/router.dart';
import 'package:fflow/core/theme/extentions/navigation_theme.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/home_shell/domain/home_page_navigation_destination.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const destinations = [
      HomePageNavigationDestination.item(
        'Queue',
        Icons.playlist_play_outlined,
        Icons.playlist_play,
        QueueRoute(),
      ),
      HomePageNavigationDestination.item(
        'Presets',
        Icons.tune_outlined,
        Icons.tune,
        PresetsRoute(),
      ),
      HomePageNavigationDestination.item(
        'Debug',
        Icons.bug_report_outlined,
        Icons.bug_report,
        DebugRoute(),
      ),
      HomePageNavigationDestination.divider(),
      HomePageNavigationDestination.item(
        'Settings',
        Icons.settings_outlined,
        Icons.settings,
        SettingsRoute(),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          const _Navigation(destinations: destinations),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    required this.destinations,
  });

  final List<HomePageNavigationDestination> destinations;

  @override
  Widget build(BuildContext context) {
    final navTheme = context.navigationTheme;

    return Material(
      color: navTheme.backgroundColor,
      child: SizedBox(
        width: 287,
        child: Column(
          children: [
            const _NavigationHeader(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  spacing: 4,
                  children: List.generate(
                    destinations.length,
                    (index) {
                      final destination = destinations[index];
                      return switch (destination) {
                        HomePageNavigationDestinationItem(
                          :final icon,
                          :final label,
                          :final route,
                        ) =>
                          _NavigationDestination(
                            selected:
                                GoRouterState.of(context).uri.path ==
                                route.location,
                            onTap: () => route.go(context),
                            icon: icon,
                            label: label,
                          ),
                        HomePageNavigationDestinationDivider() => const Divider(
                          color: Color(0xFFC4C6D0),
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                          height: 8,
                        ),
                      };
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationHeader extends StatelessWidget {
  const _NavigationHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Text(
        'Header',
        style: context.textTheme.titleSmall,
      ),
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  const _NavigationDestination({
    required this.selected,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final bool selected;
  final String label;
  final IconData icon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(9999);
    final navTheme = context.navigationTheme;
    return Material(
      color: selected
          ? navTheme.selectedItemColor
          : navTheme.unselectedItemColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: selected
                      ? navTheme.selectedItemIconColor
                      : navTheme.unselectedItemIconColor,
                ),
                const Gap(16),
                Text(
                  label,
                  style: selected
                      ? navTheme.selectedItemLabelStyle
                      : navTheme.unselectedItemLabelStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
