import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/features/presets/domain/preset_categories_table.dart';
import 'package:fflow/features/presets/domain/presets_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage.g.dart';

final storage = Storage();

@DriftDatabase(tables: [Presets, PresetCategories])
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
  SharedPreferences? __prefs;
  late final _database = AppDatabase();

  SharedPreferences get _prefs {
    assert(
      __prefs != null,
      'Storage not initialized. Call initialize() first.',
    );
    return __prefs!;
  }

  Future<void> initialize() async {
    __prefs = await SharedPreferences.getInstance();
  }

  Future<bool> clearSharedPreferences() => _prefs.clear();
  Future<List<int>> clearDatabase() async => [
    for (final table in _database.allTables) await _database.delete(table).go(),
  ];
}

class RepositoryJsonHandler<T> {
  const RepositoryJsonHandler({
    required this.fromJson,
    required this.toJson,
  });

  final T Function(Json json) fromJson;
  final Json Function(T data) toJson;
}

abstract class SharePreferencesRepository<T> {
  const SharePreferencesRepository(this.key, {this.jsonHandler});

  final String key;
  final RepositoryJsonHandler<T>? jsonHandler;

  SharedPreferences get _prefs => storage._prefs;

  Future<bool> clear() => _prefs.remove(key);

  Future<bool> save(T item) {
    if (jsonHandler != null) {
      return _prefs.setString(key, jsonEncode(jsonHandler!.toJson(item)));
    }

    return switch (item) {
      int() => _prefs.setInt(key, item),
      double() => _prefs.setDouble(key, item),
      bool() => _prefs.setBool(key, item),
      List<String>() => _prefs.setStringList(key, item),
      String() => _prefs.setString(key, item),
      _ => throw UnsupportedError('Unsupported type: ${item.runtimeType}'),
    };
  }

  T? get() {
    if (jsonHandler != null) {
      final jsonString = _prefs.getString(key);
      if (jsonString == null) return null;
      final json = jsonDecode(jsonString);
      if (json is! Json) return null;
      return jsonHandler!.fromJson(json);
    }
    final data = _prefs.get(key);
    if (data == null) return null;
    if (data is! T) {
      throw UnsupportedError(
        'Expected type $T but got ${data.runtimeType} for key $key',
      );
    }
    return data as T;
  }
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
