import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'navigation_theme.tailor.dart';

@tailorMixin
class NavigationTheme extends ThemeExtension<NavigationTheme>
    with _$NavigationThemeTailorMixin {
  const NavigationTheme({
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.selectedItemIconColor,
    required this.selectedItemLabelStyle,
    required this.unselectedItemColor,
    required this.unselectedItemIconColor,
    required this.unselectedItemLabelStyle,
  });

  @override
  final Color backgroundColor;
  @override
  final Color selectedItemColor;
  @override
  final Color selectedItemIconColor;
  @override
  final TextStyle selectedItemLabelStyle;
  @override
  final Color unselectedItemColor;
  @override
  final Color unselectedItemIconColor;
  @override
  final TextStyle unselectedItemLabelStyle;
}
