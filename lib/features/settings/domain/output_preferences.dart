import 'package:fflow/core/json/json_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'output_preferences.freezed.dart';
part 'output_preferences.g.dart';

@freezed
abstract class OutputPreferences with _$OutputPreferences {
  const factory OutputPreferences({
    required String outputDirectoryPath,
  }) = _OutputPreferences;

  factory OutputPreferences.def() =>
      const OutputPreferences(outputDirectoryPath: '');

  factory OutputPreferences.fromJson(Json json) =>
      _$OutputPreferencesFromJson(json);
}
