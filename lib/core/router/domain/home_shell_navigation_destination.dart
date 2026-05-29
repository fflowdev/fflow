import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'home_shell_navigation_destination.freezed.dart';

@freezed
sealed class HomeShellNavigationDestination
    with _$HomeShellNavigationDestination {
  const factory HomeShellNavigationDestination.item(
    String label,
    IconData icon,
    IconData selectedIcon,
    GoRouteData route,
  ) = HomeShellNavigationDestinationItem;

  const factory HomeShellNavigationDestination.divider() =
      HomeShellNavigationDestinationDivider;
}
