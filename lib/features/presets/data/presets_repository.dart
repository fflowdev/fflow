import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/presets/data/presets_dao.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:fflow/features/presets/domain/presets_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_repository.g.dart';

class PresetsRepository
    extends DatabaseRepository<PresetsDao, Presets, PresetData, Preset> {
  PresetsRepository()
    : super(
        dao: PresetsDao(),
        toDataObject: (preset) => PresetData(
          name: preset.name,
          description: preset.description,
          category: preset.category?.name,
          ffmpegArguments: preset.ffmpegArguments,
          isFavorite: preset.isFavorite,
          createdAt: preset.createdAt,
          updatedAt: preset.updatedAt,
        ),
        toBusinessObject: (data) => Preset(
          name: data.name,
          description: data.description,
          category: data.category != null
              ? PresetCategory(data.category!)
              : null,
          ffmpegArguments: data.ffmpegArguments,
          isFavorite: data.isFavorite,
          createdAt: data.createdAt,
          updatedAt: data.updatedAt,
        ),
      );

  Stream<Iterable<Preset>> watchByCategoryAndKeyword({
    String? category,
    String? keyword,
  }) {
    final data = dao.watchAllBy(
      name: keyword,
      description: keyword,
      ffmpegCommand: keyword,
      category: category,
    );
    return data.map((dataList) => dataList.map(toBusinessObject));
  }
}

@riverpod
PresetsRepository presetsRepository(Ref ref) => PresetsRepository();
