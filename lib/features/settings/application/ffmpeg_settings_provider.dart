import 'dart:convert';

import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/core/settings/application/app_settings_provider.dart';
import 'package:fflow/features/settings/domain/ffmpeg_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ffmpeg_settings_provider.g.dart';

final AppSettingsNotifierProvider<String, FfmpegSettings>
_ffmpegSettingsProvider = appSettingsProvider(
  AppSettingsNotifierArguments<String, FfmpegSettings>(
    key: 'ffmpeg',
    valueBuilder: (data) => FfmpegSettings.fromJson(jsonDecode(data) as Json),
    dataBuilder: (value) => jsonEncode(value.toJson()),
  ),
);

@Riverpod(keepAlive: true)
class FfmpegSettingsNotifier extends _$FfmpegSettingsNotifier {
  @override
  FfmpegSettings build() {
    return ref.watch(_ffmpegSettingsProvider).value ?? FfmpegSettings.def();
  }

  void setFfmpegPath(String path) {
    final newState = state.copyWith(ffmpegExecutablePath: path);
    ref.read(_ffmpegSettingsProvider.notifier).setValue(newState);
  }
}
