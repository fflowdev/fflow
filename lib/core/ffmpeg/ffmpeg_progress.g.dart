// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffmpeg_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FFmpegProgress _$FFmpegProgressFromJson(Map<String, dynamic> json) =>
    _FFmpegProgress(
      frame: (json['frame'] as num?)?.toInt(),
      fps: (json['fps'] as num?)?.toDouble(),
      totalSize: (json['totalSize'] as num?)?.toInt(),
      outTime: json['outTime'] == null
          ? null
          : Duration(microseconds: (json['outTime'] as num).toInt()),
      speed: json['speed'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FFmpegProgressToJson(_FFmpegProgress instance) =>
    <String, dynamic>{
      'frame': instance.frame,
      'fps': instance.fps,
      'totalSize': instance.totalSize,
      'outTime': instance.outTime?.inMicroseconds,
      'speed': instance.speed,
      'status': instance.status,
    };
