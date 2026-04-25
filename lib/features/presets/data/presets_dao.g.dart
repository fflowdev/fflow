// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_dao.dart';

// ignore_for_file: type=lint
mixin _$PresetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PresetCategoriesTable get presetCategories =>
      attachedDatabase.presetCategories;
  $PresetsTable get presets => attachedDatabase.presets;
  PresetsDaoManager get managers => PresetsDaoManager(this);
}

class PresetsDaoManager {
  final _$PresetsDaoMixin _db;
  PresetsDaoManager(this._db);
  $$PresetCategoriesTableTableManager get presetCategories =>
      $$PresetCategoriesTableTableManager(
        _db.attachedDatabase,
        _db.presetCategories,
      );
  $$PresetsTableTableManager get presets =>
      $$PresetsTableTableManager(_db.attachedDatabase, _db.presets);
}
