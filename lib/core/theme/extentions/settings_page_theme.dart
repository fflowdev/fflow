import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'settings_page_theme.tailor.dart';

@tailorMixin
class SettingsPageTheme extends ThemeExtension<SettingsPageTheme>
    with _$SettingsPageThemeTailorMixin {
  const SettingsPageTheme({
    required this.tileGroupTitleTextStyle,
    required this.tileTheme,
  });

  @override
  final TextStyle tileGroupTitleTextStyle;
  @override
  final SettingsListTileTheme tileTheme;
}

@tailorMixinComponent
class SettingsListTileTheme extends ThemeExtension<SettingsListTileTheme>
    with _$SettingsListTileThemeTailorMixin {
  const SettingsListTileTheme({
    this.borderRadius = const Radius.circular(12),
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.dividerColor,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
  });

  @override
  final Radius borderRadius;
  @override
  final Color backgroundColor;
  @override
  final Color iconBackgroundColor;
  @override
  final Color iconColor;
  @override
  final Color dividerColor;
  @override
  final TextStyle titleTextStyle;
  @override
  final TextStyle subtitleTextStyle;
}
