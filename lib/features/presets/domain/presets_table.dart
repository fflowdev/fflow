import 'package:drift/drift.dart';
import 'package:fflow/features/presets/domain/preset_categories_table.dart';

@DataClassName('PresetData')
class Presets extends Table {
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get category =>
      text().references(PresetCategories, #name).nullable()();
  TextColumn get ffmpegCommand => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {name};
}
