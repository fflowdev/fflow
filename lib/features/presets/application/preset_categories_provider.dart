import 'package:fflow/features/presets/application/preset_category_repository_provider.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_categories_provider.g.dart';

@riverpod
Stream<Iterable<PresetCategory>> presetCategories(Ref ref) {
  final repo = ref.watch(presetCategoryRepositoryProvider);
  return repo.watchAll();
}
