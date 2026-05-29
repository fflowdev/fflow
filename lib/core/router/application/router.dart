import 'package:fflow/core/router/presentation/home_shell.dart';
import 'package:fflow/features/debug/presentation/debug_page.dart';
import 'package:fflow/features/presets/presentation/presets_page.dart';
import 'package:fflow/features/queue/presentation/queue_page.dart';
import 'package:fflow/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: const QueueRoute().location,
  navigatorKey: rootNavigatorKey,
);

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeShellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<HomeShellRoute>(
  routes: [
    TypedGoRoute<QueueRoute>(path: '/queue'),
    TypedGoRoute<PresetsRoute>(path: '/presets'),
    TypedGoRoute<DebugRoute>(path: '/debug'),
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

class QueueRoute extends GoRouteData with $QueueRoute {
  const QueueRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QueuePage();
  }
}

class PresetsRoute extends GoRouteData with $PresetsRoute {
  const PresetsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PresetsPage();
  }
}

class DebugRoute extends GoRouteData with $DebugRoute {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugPage();
  }
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}
