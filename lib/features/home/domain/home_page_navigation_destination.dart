import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'home_page_navigation_destination.freezed.dart';

@freezed
sealed class HomePageNavigationDestination
    with _$HomePageNavigationDestination {
  const factory HomePageNavigationDestination.item(
    String label,
    IconData icon,
    IconData selectedIcon,
    GoRouteData route,
  ) = HomePageNavigationDestinationItem;

  const factory HomePageNavigationDestination.divider() =
      HomePageNavigationDestinationDivider;
}
