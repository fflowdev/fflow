import 'package:fflow/features/presets/data/preset_category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_category_repository_provider.g.dart';

@riverpod
PresetCategoryRepository presetCategoryRepository(Ref ref) =>
    PresetCategoryRepository();
