import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:fflow/core/json/color_converter.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    required String? ffmpegPath,
    required String? ffprobePath,
    required ThemeSettings themeSettings,
  }) = _AppSettings;

  factory AppSettings.def() => AppSettings(
    ffmpegPath: null,
    ffprobePath: null,
    themeSettings: ThemeSettings.def(),
  );

  factory AppSettings.fromJson(Json json) => _$AppSettingsFromJson(json);
}

@freezed
abstract class ThemeSettings with _$ThemeSettings {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [ColorConverter()])
  const factory ThemeSettings({
    required Color primaryColor,
    required bool usePlatformSeedColor,
    required ThemeMode themeMode,
  }) = _ThemeSettings;

  const ThemeSettings._();

  factory ThemeSettings.def() => const ThemeSettings(
    primaryColor: Colors.blue,
    usePlatformSeedColor: true,
    themeMode: ThemeMode.system,
  );

  factory ThemeSettings.fromJson(Json json) => _$ThemeSettingsFromJson(json);
}

@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  AppSettings build() {
    final saveDebouncer = Debouncer<AppSettings?>(
      const Duration(milliseconds: 500),
      initialValue: null,
      onChanged: (value) async {
        if (value != null) {
          logger.d('Saving app settings: $value');
          await storage.saveAppSettings(value);
        }
      },
    );
    ref.onDispose(saveDebouncer.cancel);
    listenSelf((previous, next) async {
      if (previous != null && next != previous) {
        logger.d('App settings changed: $next');
        saveDebouncer.value = next;
      }
    });
    return storage.getAppSettings() ?? AppSettings.def();
  }

  void updateFFmpegPath(String? path) {
    state = state.copyWith(ffmpegPath: path);
  }

  void updateFFprobePath(String? path) {
    state = state.copyWith(ffprobePath: path);
  }

  void toggleUsePlatformSeedColor() {
    state = state.copyWith(
      themeSettings: state.themeSettings.copyWith(
        usePlatformSeedColor: !state.themeSettings.usePlatformSeedColor,
      ),
    );
  }

  void updatePrimaryColor(Color color) {
    state = state.copyWith(
      themeSettings: state.themeSettings.copyWith(primaryColor: color),
    );
  }

  void updateThemeMode(ThemeMode themeMode) {
    state = state.copyWith(
      themeSettings: state.themeSettings.copyWith(themeMode: themeMode),
    );
  }
}
