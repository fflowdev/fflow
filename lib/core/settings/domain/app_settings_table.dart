import 'package:drift/drift.dart';

@DataClassName('AppSettingsData')
class AppSettingsTable extends Table {
  TextColumn get key => text()();
  Column get value => sqliteAny()();

  @override
  Set<Column<Object>>? get primaryKey => {key};
}
