import 'dart:convert';

import 'package:fflow/core/json/double_converter.dart';
import 'package:fflow/core/json/int_converter.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ffmpeg_progress.freezed.dart';
part 'ffmpeg_progress.g.dart';

@freezed
abstract class FFmpegProgress with _$FFmpegProgress {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [IntConverter(), DoubleConverter()])
  const factory FFmpegProgress({
    required int? frame,
    required double? fps,
    required String? bitrate,
    required int? totalSize, // bytes
    required int? outTimeMs,
    required String? speed,
    required String? progress, // continue 或 end
  }) = _FFmpegProgress;

  const FFmpegProgress._();

  factory FFmpegProgress.fromJson(Json json) => _$FFmpegProgressFromJson(json);

  /// Parse the FFmpeg output line into an FFmpegProgress instance.
  ///
  /// output example:
  /// frame=120
  /// fps=25.2
  /// stream_0_0_q=28.0
  /// bitrate=102.5kbits/s
  /// total_size=48234
  /// out_time_us=4000000
  /// out_time_ms=4000000
  /// out_time=00:00:04.000000
  /// dup_frames=0
  /// drop_frames=0
  /// speed=1.42x
  /// progress=continue
  factory FFmpegProgress.parseOutput(String output) {
    final lines = const LineSplitter()
        .convert(output)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty);

    (String, String) splitKeyValue(String line) {
      final parts = line.split('=');

      final key = parts.firstOrNull?.trim();
      final value = parts.elementAtOrNull(1)?.trim() ?? '';

      if (key == null || key.isEmpty) {
        throw FormatException('Invalid FFmpeg output line: $line');
      }

      return (key, value);
    }

    final map = Map.fromEntries(
      lines.map((line) {
        final (key, value) = splitKeyValue(line);
        return MapEntry(key, value);
      }),
    );
    return FFmpegProgress.fromJson(map);
  }

  Duration? get outTime =>
      outTimeMs != null ? Duration(milliseconds: outTimeMs!) : null;
}
