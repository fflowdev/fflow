import 'package:fflow/core/json/color_converter.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_settings.freezed.dart';
part 'theme_settings.g.dart';

@freezed
abstract class ThemeSettings with _$ThemeSettings {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [ColorConverter()])
  const factory ThemeSettings({
    required Color primaryColor,
    required bool usePlatformSeedColor,
    required ThemeMode themeMode,
  }) = _ThemeSettings;

  const ThemeSettings._();

  factory ThemeSettings.def() => const ThemeSettings(
    primaryColor: Colors.blue,
    usePlatformSeedColor: true,
    themeMode: ThemeMode.system,
  );

  factory ThemeSettings.fromJson(Json json) => _$ThemeSettingsFromJson(json);
}
