import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preset.freezed.dart';

@freezed
abstract class Preset with _$Preset {
  const factory Preset({
    required String name,
    required String description,
    PresetCategory? category,
    required String ffmpegCommand,
    @Default(false) bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Preset;
}
