import 'package:drift/drift.dart';

@DataClassName('PresetCategoryData')
class PresetCategories extends Table {
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {name};
}
