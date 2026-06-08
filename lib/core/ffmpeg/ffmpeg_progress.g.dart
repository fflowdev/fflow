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
      totalSize: const IntConverter().fromJson(json['total_size']),
      outTimeMs: const IntConverter().fromJson(json['out_time_ms']),
      speed: json['speed'] as String?,
      progress: json['progress'] as String?,
    );

Map<String, dynamic> _$FFmpegProgressToJson(_FFmpegProgress instance) =>
    <String, dynamic>{
      'frame': const IntConverter().toJson(instance.frame),
      'fps': const DoubleConverter().toJson(instance.fps),
      'bitrate': instance.bitrate,
      'total_size': const IntConverter().toJson(instance.totalSize),
      'out_time_ms': const IntConverter().toJson(instance.outTimeMs),
      'speed': instance.speed,
      'progress': instance.progress,
    };
