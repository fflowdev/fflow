// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_category_dao.dart';

// ignore_for_file: type=lint
mixin _$PresetCategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $PresetCategoriesTable get presetCategories =>
      attachedDatabase.presetCategories;
  PresetCategoryDaoManager get managers => PresetCategoryDaoManager(this);
}

class PresetCategoryDaoManager {
  final _$PresetCategoryDaoMixin _db;
  PresetCategoryDaoManager(this._db);
  $$PresetCategoriesTableTableManager get presetCategories =>
      $$PresetCategoriesTableTableManager(
        _db.attachedDatabase,
        _db.presetCategories,
      );
}
