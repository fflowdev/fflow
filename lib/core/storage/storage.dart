import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/core/settings/domain/app_settings_table.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/features/presets/domain/preset_categories_table.dart';
import 'package:fflow/features/presets/domain/presets_table.dart';
import 'package:path_provider/path_provider.dart';

part 'storage.g.dart';

final storage = Storage();

@DriftDatabase(tables: [Presets, PresetCategories, AppSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

class Storage {
  late final _database = AppDatabase();

  Future<List<int>> clearDatabase() async {
    final result = await _database.transaction(() async {
      return [
        for (final table in _database.allTables)
          await _database.delete(table).go(),
      ];
    });
    logger.i('Database cleared: $result');
    return result;
  }
}

class RepositoryJsonHandler<T> {
  const RepositoryJsonHandler({
    required this.fromJson,
    required this.toJson,
  });

  final T Function(Json json) fromJson;
  final Json Function(T data) toJson;
}

abstract class DatabaseDao<T extends Table, DO extends DataClass>
    extends DatabaseAccessor<AppDatabase> {
  DatabaseDao() : super(storage._database);

  TableInfo<T, DO> get table;
  Insertable<DO> Function(DO data) get toCompanion;

  Future<void> insertData(DO data) => into(table).insert(toCompanion(data));

  Future<void> updateData(DO data) => update(table).replace(toCompanion(data));

  Future<void> deleteData(DO data) => delete(table).delete(toCompanion(data));

  Future<List<DO>> getAll() => select(table).get();

  Stream<List<DO>> watchAll() => select(table).watch();
}

abstract class DatabaseRepository<
  Dao extends DatabaseDao<T, DO>,
  T extends Table,
  DO extends DataClass,
  BO
> {
  const DatabaseRepository({
    required this.dao,
    required this.toDataObject,
    required this.toBusinessObject,
  });

  final Dao dao;
  final DO Function(BO businessObject) toDataObject;
  final BO Function(DO data) toBusinessObject;

  Future<void> insert(BO data) => dao.insertData(toDataObject(data));

  Future<void> update(BO data) => dao.updateData(toDataObject(data));

  Future<void> delete(BO data) => dao.deleteData(toDataObject(data));

  Stream<Iterable<BO>> watchAll() => dao.watchAll().map(
    (dataList) => dataList.map(toBusinessObject),
  );

  Future<List<BO>> getAll() async {
    final data = await dao.getAll();
    if (data is List<BO>) {
      return data as List<BO>;
    }
    return data.map(toBusinessObject).toList();
  }
}
