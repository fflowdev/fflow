import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _Destination {
  const _Destination(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});

  final Widget child;

  static const routePaths = ['/dashboard', '/presets', '/settings'];

  int _getCurrentIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    return routePaths.indexWhere(path.startsWith);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);
    const destinations = [
      _Destination('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
      _Destination('Presets', Icons.tune_outlined, Icons.tune),
    ];
    const secondaryDestinations = [
      _Destination('Settings', Icons.settings_outlined, Icons.settings),
    ];

    void handleScreenChanged(int index) => switch (index) {
      0 => context.go(routePaths[0]),
      1 => context.go(routePaths[1]),
      2 => context.go(routePaths[2]),
      _ => null,
    };

    return Scaffold(
      body: Row(
        children: [
          _Navigation(
            destinations: destinations,
            secondaryDestinations: secondaryDestinations,
            selectedIndex: currentIndex,
            onDestinationSelected: handleScreenChanged,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    required this.destinations,
    required this.secondaryDestinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final List<_Destination> destinations;
  final List<_Destination> secondaryDestinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      children: [
        const _NavigationHeader(),
        ...destinations.map(
          (e) => NavigationDrawerDestination(
            icon: Icon(e.icon),
            selectedIcon: Icon(e.selectedIcon),
            label: Text(e.label),
          ),
        ),
        const Divider(
          thickness: 1,
          indent: 16,
          endIndent: 16,
          height: 8,
        ),
        ...secondaryDestinations.map(
          (e) => NavigationDrawerDestination(
            icon: Icon(e.icon),
            selectedIcon: Icon(e.selectedIcon),
            label: Text(e.label),
          ),
        ),
      ],
    );

    // final theme = Theme.of(context).extension<AppNavigationThemeData>();

    // return Material(
    //   color: theme?.backgroundColor,
    //   shape: theme?.shape,
    //   child: SizedBox(
    //     width: 287,
    //     child: Column(
    //       children: [
    //         const _NavigationHeader(),
    //         Flexible(
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 12,
    //               vertical: 16,
    //             ),
    //             child: Column(
    //               spacing: 4,
    //               children: [
    //                 ...List.generate(destinations.length, (index) {
    //                   final destination = destinations[index];
    //                   return _NavigationDestination(
    //                     isSelected: index == selectedIndex,
    //                     onTap: () => onDestinationSelected(index),
    //                     icon: destination.icon,
    //                     selectedIcon: destination.selectedIcon,
    //                     label: destination.label,
    //                   );
    //                 }),
    //                 const Divider(
    //                   color: Color(0xFFC4C6D0),
    //                   thickness: 1,
    //                   indent: 16,
    //                   endIndent: 16,
    //                   height: 0,
    //                 ),
    //                 ...List.generate(secondaryDestinations.length, (index) {
    //                   final destination = secondaryDestinations[index];
    //                   return _NavigationDestination(
    //                     isSelected:
    //                         destinations.length + index == selectedIndex,
    //                     onTap: () =>
    //                         onDestinationSelected(destinations.length + index),
    //                     icon: destination.icon,
    //                     selectedIcon: destination.selectedIcon,
    //                     label: destination.label,
    //                   );
    //                 }),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
