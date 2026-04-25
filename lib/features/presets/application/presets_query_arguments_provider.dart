import 'package:fflow/features/presets/domain/preset_category.dart';
import 'package:fflow/features/presets/domain/presets_query_arguments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_query_arguments_provider.g.dart';

@riverpod
class PresetsQueryArgumentsNotifier extends _$PresetsQueryArgumentsNotifier {
  @override
  PresetsQueryArguments build() {
    return const PresetsQueryArguments();
  }

  void updateCategory(PresetCategory? category) {
    state = state.copyWith(category: category);
  }

  void updateQueryName(String? queryName) {
    state = state.copyWith(queryName: queryName);
  }
}
