import 'dart:convert';

import 'package:fflow/core/models/json.dart';
import 'package:fflow/core/settings/application/app_settings_provider.dart';
import 'package:fflow/features/settings/domain/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_settings_provider.g.dart';

final AppSettingsNotifierProvider<String, ThemeSettings>
_themeSettingsProvider = appSettingsProvider(
  AppSettingsNotifierArguments<String, ThemeSettings>(
    key: 'theme',
    valueBuilder: (data) => ThemeSettings.fromJson(jsonDecode(data) as Json),
    dataBuilder: (value) => jsonEncode(value.toJson()),
  ),
);

@Riverpod(keepAlive: true)
class ThemeSettingsNotifier extends _$ThemeSettingsNotifier {
  @override
  ThemeSettings build() {
    return ref.watch(_themeSettingsProvider).value ?? ThemeSettings.def();
  }

  void setThemeMode(ThemeMode mode) {
    final newState = state.copyWith(themeMode: mode);
    ref.read(_themeSettingsProvider.notifier).setValue(newState);
  }
}
