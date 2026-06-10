// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffmpeg_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FFmpegProgress _$FFmpegProgressFromJson(Map<String, dynamic> json) =>
    _FFmpegProgress(
      frame: const IntConverter().fromJson(json['frame']),
      fps: const DoubleConverter().fromJson(json['fps']),
      bitrate: json['bitrate'] as String?,
      totalSize: const IntConverter().fromJson(json['totalSize']),
      outTimeMs: const IntConverter().fromJson(json['outTimeMs']),
      speed: json['speed'] as String?,
      progress: json['progress'] as String?,
    );

Map<String, dynamic> _$FFmpegProgressToJson(_FFmpegProgress instance) =>
    <String, dynamic>{
      'frame': const IntConverter().toJson(instance.frame),
      'fps': const DoubleConverter().toJson(instance.fps),
      'bitrate': instance.bitrate,
      'totalSize': const IntConverter().toJson(instance.totalSize),
      'outTimeMs': const IntConverter().toJson(instance.outTimeMs),
      'speed': instance.speed,
      'progress': instance.progress,
    };
