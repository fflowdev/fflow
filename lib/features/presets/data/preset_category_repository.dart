import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/presets/data/preset_category_dao.dart';
import 'package:fflow/features/presets/domain/preset_categories_table.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';

class PresetCategoryRepository
    extends
        DatabaseRepository<
          PresetCategoryDao,
          PresetCategories,
          PresetCategoryData,
          PresetCategory
        > {
  PresetCategoryRepository()
    : super(
        dao: PresetCategoryDao(),
        toDataObject: (category) => PresetCategoryData(
          name: category.name,
          description: category.description,
        ),
        toBusinessObject: (data) => PresetCategory(
          data.name,
          description: data.description,
        ),
      );
}
