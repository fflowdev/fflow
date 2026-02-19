import 'package:fflow/core/json/json_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ffmpeg_progress.freezed.dart';
part 'ffmpeg_progress.g.dart';

@freezed
abstract class FFmpegProgress with _$FFmpegProgress {
  const factory FFmpegProgress({
    required int? frame,
    required double? fps,
    required int? totalSize, // bytes
    required Duration? outTime,
    required String? speed,
    required String? status, // continue 或 end
  }) = _FFmpegProgress;

  factory FFmpegProgress.fromJson(Json json) => _$FFmpegProgressFromJson(json);
}
