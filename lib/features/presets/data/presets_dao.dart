import 'package:drift/drift.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/presets/domain/presets_table.dart';

part 'presets_dao.g.dart';

@DriftAccessor(tables: [Presets])
class PresetsDao extends DatabaseDao<Presets, PresetData>
    with _$PresetsDaoMixin {
  @override
  TableInfo<Presets, PresetData> get table => presets;

  @override
  Insertable<PresetData> Function(PresetData data) get toCompanion =>
      (preset) => PresetsCompanion(
        name: Value(preset.name),
        description: Value(preset.description),
        category: Value(preset.category),
        ffmpegArguments: Value(preset.ffmpegArguments),
        isFavorite: Value(preset.isFavorite),
        createdAt: Value(preset.createdAt),
        updatedAt: Value(preset.updatedAt),
      );

  Stream<List<PresetData>> watchAllBy({
    String? name,
    String? description,
    String? category,
    String? ffmpegCommand,
    bool? isFavorite,
  }) {
    final query = select(table);

    if (name != null) {
      query.where((tbl) => tbl.name.like('%$name%'));
    }
    if (description != null) {
      query.where((tbl) => tbl.description.like('%$description%'));
    }
    if (category != null) {
      query.where((tbl) => tbl.category.like('%$category%'));
    }
    if (ffmpegCommand != null) {
      query.where((tbl) => tbl.ffmpegArguments.like('%$ffmpegCommand%'));
    }
    if (isFavorite != null) {
      query.where((tbl) => tbl.isFavorite.equals(isFavorite));
    }

    return query.watch();
  }
}
