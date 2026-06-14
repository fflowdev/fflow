import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/shared/settings/theme/domain/theme_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    required String? ffmpegPath,
    required String? ffprobePath,
    required String? outputDiretoryPath,
    @Default(1) int maxConcurrentTasks,
    required ThemeSettings themeSettings,
  }) = _AppSettings;

  factory AppSettings.def() => AppSettings(
    ffmpegPath: null,
    ffprobePath: null,
    outputDiretoryPath: null,
    themeSettings: ThemeSettings.def(),
  );

  factory AppSettings.fromJson(Json json) => _$AppSettingsFromJson(json);
}
