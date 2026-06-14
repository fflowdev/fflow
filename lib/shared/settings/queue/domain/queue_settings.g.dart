// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueSettings _$QueueSettingsFromJson(Map<String, dynamic> json) =>
    _QueueSettings(
      maxConcurrentTasks: (json['maxConcurrentTasks'] as num).toInt(),
    );

Map<String, dynamic> _$QueueSettingsToJson(_QueueSettings instance) =>
    <String, dynamic>{'maxConcurrentTasks': instance.maxConcurrentTasks};
