import 'package:fflow/features/presets/data/preset_category_repository.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_categories_provider.g.dart';

@riverpod
Future<List<PresetCategory>> presetCategories(Ref ref) {
  final repo = PresetCategoryRepository();
  return repo.getAll();
}
