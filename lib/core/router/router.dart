import 'package:fflow/features/home/dashboard/dashboard_page.dart';
import 'package:fflow/features/home/home_shell.dart';
import 'package:fflow/features/home/presets/presets_page.dart';
import 'package:fflow/features/home/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/dashboard',
  navigatorKey: rootNavigatorKey,
);

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeShellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<HomeShellRoute>(
  routes: [
    TypedGoRoute<DashboardRoute>(path: '/dashboard'),
    TypedGoRoute<PresetsRoute>(path: '/presets'),
    TypedGoRoute<SettingsRoute>(path: '/settings'),
  ],
)
class HomeShellRoute extends ShellRouteData {
  const HomeShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = homeShellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomeShell(child: navigator);
  }
}

class DashboardRoute extends GoRouteData with $DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}

class PresetsRoute extends GoRouteData with $PresetsRoute {
  const PresetsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PresetsPage();
  }
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}
