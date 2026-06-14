import 'package:drift/drift.dart';
import 'package:fflow/core/settings/domain/app_settings_table.dart';
import 'package:fflow/core/storage/storage.dart';

part 'app_settings_dao.g.dart';

@DriftAccessor(tables: [AppSettingsTable])
class AppSettingsDao extends DatabaseDao<AppSettingsTable, AppSettingsData>
    with _$AppSettingsDaoMixin {
  @override
  TableInfo<AppSettingsTable, AppSettingsData> get table => appSettingsTable;

  @override
  Insertable<AppSettingsData> Function(AppSettingsData data) get toCompanion =>
      (data) => AppSettingsTableCompanion(
        key: Value(data.key),
        value: Value(data.value),
      );

  Future<AppSettingsData?> selectByKey(String key) {
    return (select(
      table,
    )..where((tbl) => tbl.key.equals(key))).getSingleOrNull();
  }

  Future<int> setByKey(String key, DriftAny value) {
    final data = AppSettingsData(key: key, value: value);
    return into(table).insertOnConflictUpdate(toCompanion(data));
  }

  Future<int> deleteByKey(String key) {
    return (delete(table)..where((tbl) => tbl.key.equals(key))).go();
  }
}
