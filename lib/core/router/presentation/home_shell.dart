import 'dart:async';

import 'package:fflow/core/router/application/router.dart';
import 'package:fflow/core/router/domain/home_shell_navigation_destination.dart';
import 'package:fflow/core/theme/extentions/navigation_theme.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_titlebar/windows_titlebar.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const destinations = [
      HomeShellNavigationDestination.item(
        'Queue',
        Icons.playlist_play_outlined,
        Icons.playlist_play,
        QueueRoute(),
      ),
      HomeShellNavigationDestination.item(
        'Presets',
        Icons.tune_outlined,
        Icons.tune,
        PresetsRoute(),
      ),
      HomeShellNavigationDestination.item(
        'Debug',
        Icons.bug_report_outlined,
        Icons.bug_report,
        DebugRoute(),
      ),
      HomeShellNavigationDestination.divider(),
      HomeShellNavigationDestination.item(
        'Settings',
        Icons.settings_outlined,
        Icons.settings,
        SettingsRoute(),
      ),
    ];

    Widget widget = Scaffold(
      appBar: useCustomWindowTitleBar ? const _WindowTitleBar() : null,
      body: Row(
        children: [
          const _Navigation(destinations: destinations),
          Expanded(child: child),
        ],
      ),
    );

    if (useCustomWindowTitleBar) {
      widget = VirtualWindowFrame(child: widget);
    }

    return widget;
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    required this.destinations,
  });

  final List<HomeShellNavigationDestination> destinations;

  @override
  Widget build(BuildContext context) {
    final navTheme = context.navigationTheme;

    return Material(
      color: navTheme.backgroundColor,
      child: SizedBox(
        width: 287,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  spacing: 8,
                  children: List.generate(
                    destinations.length,
                    (index) {
                      final destination = destinations[index];
                      return switch (destination) {
                        HomeShellNavigationDestinationItem(
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
                        HomeShellNavigationDestinationDivider() =>
                          const Divider(
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
            const VerticalDivider(width: 1),
          ],
        ),
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

class _WindowTitleBar extends StatefulWidget implements PreferredSizeWidget {
  const _WindowTitleBar();

  @override
  State<_WindowTitleBar> createState() => _WindowTitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kWindowTitleBarHeight);
}

class _WindowTitleBarState extends State<_WindowTitleBar> with WindowListener {
  late final ValueNotifier<FutureOr<bool>> _isMaximized;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _isMaximized = ValueNotifier(windowManager.isMaximized());
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() {
    _isMaximized.value = true;
  }

  @override
  void onWindowUnmaximize() {
    _isMaximized.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = switch (Theme.brightnessOf(context)) {
      Brightness.light => const WindowButtonColor.light(),
      Brightness.dark => const WindowButtonColor.dark(),
    };
    final closeButtonColor = switch (Theme.brightnessOf(context)) {
      Brightness.light => const WindowButtonColor.closeLight(),
      Brightness.dark => const WindowButtonColor.closeDark(),
    };
    const animated = true;

    return SizedBox.fromSize(
      size: widget.preferredSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.navigationTheme.backgroundColor,
          border: Border(
            bottom: BorderSide(color: context.theme.dividerColor),
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              child: DragToMoveArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('FFlow'),
                ),
              ),
            ),

            WindowButton.minimize(
              buttonColor: buttonColor,
              animated: animated,
              onTap: windowManager.minimize,
            ),
            ValueListenableBuilder(
              valueListenable: _isMaximized,
              builder: (context, isMaximized, child) {
                Widget builder({required bool isMaximized}) {
                  return isMaximized
                      ? WindowButton.unmaximize(
                          buttonColor: buttonColor,
                          animated: animated,
                          onTap: windowManager.unmaximize,
                        )
                      : WindowButton.maximize(
                          buttonColor: buttonColor,
                          animated: animated,
                          onTap: windowManager.maximize,
                        );
                }

                final isMaximizedFutureOr = isMaximized;
                if (isMaximizedFutureOr is bool) {
                  return builder(isMaximized: isMaximizedFutureOr);
                }

                return FutureBuilder(
                  future: isMaximizedFutureOr,
                  builder: (context, snapshot) {
                    final isMaximized = snapshot.data ?? false;
                    return builder(isMaximized: isMaximized);
                  },
                );
              },
            ),
            WindowButton.close(
              buttonColor: closeButtonColor,
              animated: animated,
              onTap: windowManager.close,
            ),
          ],
        ),
      ),
    );
  }
}
