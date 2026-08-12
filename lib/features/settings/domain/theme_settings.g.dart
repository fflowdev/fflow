// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeSettings _$ThemeSettingsFromJson(Map<String, dynamic> json) =>
    _ThemeSettings(
      primaryColor: const ColorConverter().fromJson(
        (json['primaryColor'] as num).toInt(),
      ),
      usePlatformSeedColor: json['usePlatformSeedColor'] as bool,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
    );

Map<String, dynamic> _$ThemeSettingsToJson(_ThemeSettings instance) =>
    <String, dynamic>{
      'primaryColor': const ColorConverter().toJson(instance.primaryColor),
      'usePlatformSeedColor': instance.usePlatformSeedColor,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
