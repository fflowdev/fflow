import 'package:fflow/core/json/json_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ffmpeg_settings.freezed.dart';
part 'ffmpeg_settings.g.dart';

@freezed
abstract class FfmpegSettings with _$FfmpegSettings {
  const factory FfmpegSettings({
    required String ffmpegExecutablePath,
  }) = _FfmpegSettings;

  factory FfmpegSettings.def() =>
      const FfmpegSettings(ffmpegExecutablePath: '');

  factory FfmpegSettings.fromJson(Json json) => _$FfmpegSettingsFromJson(json);
}
