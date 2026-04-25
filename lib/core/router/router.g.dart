// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeShellRoute];

RouteBase get $homeShellRoute => ShellRouteData.$route(
  navigatorKey: HomeShellRoute.$navigatorKey,
  factory: $HomeShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/queue', factory: $QueueRoute._fromState),
    GoRouteData.$route(path: '/presets', factory: $PresetsRoute._fromState),
    GoRouteData.$route(path: '/debug', factory: $DebugRoute._fromState),
    GoRouteData.$route(path: '/settings', factory: $SettingsRoute._fromState),
  ],
);

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

mixin $QueueRoute on GoRouteData {
  static QueueRoute _fromState(GoRouterState state) => const QueueRoute();

  @override
  String get location => GoRouteData.$location('/queue');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PresetsRoute on GoRouteData {
  static PresetsRoute _fromState(GoRouterState state) => const PresetsRoute();

  @override
  String get location => GoRouteData.$location('/presets');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugRoute on GoRouteData {
  static DebugRoute _fromState(GoRouterState state) => const DebugRoute();

  @override
  String get location => GoRouteData.$location('/debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
