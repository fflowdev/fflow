import 'package:drift/drift.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/presets/domain/preset_categories_table.dart';

part 'preset_category_dao.g.dart';

@DriftAccessor(tables: [PresetCategories])
class PresetCategoryDao
    extends DatabaseDao<PresetCategories, PresetCategoryData>
    with _$PresetCategoryDaoMixin {
  @override
  TableInfo<PresetCategories, PresetCategoryData> get table => presetCategories;

  @override
  Insertable<PresetCategoryData> Function(PresetCategoryData data)
  get toCompanion =>
      (presetCategory) => PresetCategoriesCompanion(
        name: Value(presetCategory.name),
        description: Value(presetCategory.description),
      );
}
