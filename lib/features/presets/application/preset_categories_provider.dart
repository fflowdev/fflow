import 'package:fflow/features/presets/data/preset_category_repository.dart';
import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_categories_provider.g.dart';

@riverpod
class PresetCategoriesNotifier extends _$PresetCategoriesNotifier {
  @override
  Stream<Iterable<PresetCategory>> build() {
    final repo = ref.watch(presetCategoryRepositoryProvider);
    return repo.watchAll();
  }

  Future<void> addCategory(PresetCategory category) async {
    final repo = ref.read(presetCategoryRepositoryProvider);
    await repo.insert(category);
  }

  Future<void> updateCategory(PresetCategory category) async {
    final repo = ref.read(presetCategoryRepositoryProvider);
    await repo.update(category);
  }

  Future<void> deleteCategory(PresetCategory category) async {
    final repo = ref.read(presetCategoryRepositoryProvider);
    await repo.delete(category);
  }
}
