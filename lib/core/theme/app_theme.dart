import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme({required this.colorScheme, required this.darkColorScheme});

  final ColorScheme colorScheme;
  final ColorScheme darkColorScheme;

  ThemeData get theme => _getThemeData(colorScheme);
  ThemeData get darkTheme => _getThemeData(darkColorScheme);

  ThemeData _getThemeData(ColorScheme colorScheme) {
    final theme = ThemeData.from(colorScheme: colorScheme);
    return theme;
  }
}
