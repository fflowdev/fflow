import 'dart:convert';
import 'dart:io';

import 'package:fflow/core/models/json.dart';
import 'package:fflow/core/settings/application/app_settings_provider.dart';
import 'package:fflow/features/settings/domain/output_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'output_preferences_provider.g.dart';

final AppSettingsNotifierProvider<String, OutputPreferences>
_outputPreferencesProvider = appSettingsProvider(
  AppSettingsNotifierArguments<String, OutputPreferences>(
    key: 'outputPreferences',
    valueBuilder: (json) =>
        OutputPreferences.fromJson(jsonDecode(json) as Json),
    dataBuilder: (value) => jsonEncode(
      value.toJson(),
    ),
  ),
);

@Riverpod(keepAlive: true)
class OutputPreferencesNotifier extends _$OutputPreferencesNotifier {
  @override
  OutputPreferences build() {
    return ref.watch(_outputPreferencesProvider).value ??
        OutputPreferences.def();
  }

  void setOutputDirectoryPath(String path) {
    final directory = Directory(path);
    if (!directory.existsSync()) {
      throw ArgumentError('The provided path does not exist: $path');
    }

    final newState = state.copyWith(outputDirectoryPath: path);
    ref.read(_outputPreferencesProvider.notifier).setValue(newState);
  }
}
