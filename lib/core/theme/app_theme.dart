import 'package:fflow/core/extension/color_extension.dart';
import 'package:fflow/core/theme/extentions/navigation_theme.dart';
import 'package:fflow/core/theme/extentions/settings_page_theme.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';

class AppTheme {
  const AppTheme({required this.colorScheme, required this.darkColorScheme});

  final ColorScheme colorScheme;
  final ColorScheme darkColorScheme;

  ThemeData get theme => _getThemeData(colorScheme);
  ThemeData get darkTheme => _getThemeData(darkColorScheme);

  ThemeData _getThemeData(ColorScheme colorScheme) {
    final brightness = colorScheme.brightness;
    final primaryColor = colorScheme.primary;
    final theme = ThemeData.from(colorScheme: colorScheme).copyWith(
      inputDecorationTheme: const InputDecorationThemeData(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      extensions: [
        AppThemeData(
          surface: Color.lerp(
            switch (brightness) {
              Brightness.light => const Color(0xFFF3F3F3),
              Brightness.dark => Colors.black,
            },
            primaryColor,
            0.08,
          )!,
        ),
        NavigationTheme(
          backgroundColor: Color.lerp(
            switch (brightness) {
              Brightness.light => Colors.white,
              Brightness.dark => const Color(0xFF0F0F0F),
            },
            primaryColor,
            0.08,
          )!,
          selectedItemColor: colorScheme.primary,
          selectedItemIconColor: colorScheme.onPrimary,
          selectedItemLabelStyle: TextStyle(
            color: colorScheme.onPrimary,
          ),
          unselectedItemColor: Color.lerp(
            switch (brightness) {
              Brightness.light => Colors.white,
              Brightness.dark => const Color(0xFF0F0F0F),
            },
            primaryColor,
            0.08,
          )!,
          unselectedItemIconColor: colorScheme.onSurfaceVariant,
          unselectedItemLabelStyle: TextStyle(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SettingsPageTheme(
          tileGroupTitleTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 14,
          ),
          tileTheme: SettingsListTileTheme(
            backgroundColor: Color.lerp(
              switch (brightness) {
                Brightness.light => Colors.white,
                Brightness.dark => const Color(0xFF0F0F0F),
              },
              primaryColor,
              0.08,
            )!,
            iconBackgroundColor: Color.lerp(
              switch (brightness) {
                Brightness.light => Colors.white.darken(0.05),
                Brightness.dark => const Color(0xFF0F0F0F).lighten(0.08),
              },
              primaryColor,
              0.08,
            )!,
            iconColor: colorScheme.onPrimaryContainer,
            dividerColor: colorScheme.outlineVariant,
            titleTextStyle: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            subtitleTextStyle: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
    return theme;
  }
}

@tailorMixin
class AppThemeData extends ThemeExtension<AppThemeData>
    with _$AppThemeDataTailorMixin {
  const AppThemeData({required this.surface});

  @override
  final Color surface;
}
