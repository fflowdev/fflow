import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presets_query_arguments.freezed.dart';

@freezed
abstract class PresetsQueryArguments with _$PresetsQueryArguments {
  const factory PresetsQueryArguments({
    PresetCategory? category,
    String? queryName,
  }) = _PresetsQueryArguments;
}
