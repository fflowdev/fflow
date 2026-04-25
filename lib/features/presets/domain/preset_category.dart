import 'package:freezed_annotation/freezed_annotation.dart';

part 'preset_category.freezed.dart';

@freezed
abstract class PresetCategory with _$PresetCategory {
  const factory PresetCategory(String name, {String? description}) =
      _PresetCategory;
}
