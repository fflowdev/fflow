// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  ffmpegPath: json['ffmpegPath'] as String?,
  ffprobePath: json['ffprobePath'] as String?,
  outputDiretoryPath: json['outputDiretoryPath'] as String?,
  maxConcurrentTasks: (json['maxConcurrentTasks'] as num?)?.toInt() ?? 1,
  themeSettings: ThemeSettings.fromJson(
    json['themeSettings'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'ffmpegPath': instance.ffmpegPath,
      'ffprobePath': instance.ffprobePath,
      'outputDiretoryPath': instance.outputDiretoryPath,
      'maxConcurrentTasks': instance.maxConcurrentTasks,
      'themeSettings': instance.themeSettings,
    };
