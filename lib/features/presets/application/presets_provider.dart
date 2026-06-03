import 'package:fflow/features/presets/data/presets_repository.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/presets_query_arguments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_provider.g.dart';

@riverpod
class PresetsNotifier extends _$PresetsNotifier {
  @override
  Stream<Iterable<Preset>> build(
    PresetsQueryArguments args,
  ) {
    final repo = ref.watch(presetsRepositoryProvider);
    return repo.watchByCategoryAndKeyword(
      category: args.category?.name,
      keyword: args.queryName,
    );
  }

  Future<void> addPreset(Preset preset) {
    final repo = ref.read(presetsRepositoryProvider);
    return repo.insert(preset);
  }

  Future<void> updatePreset(Preset preset) {
    final repo = ref.read(presetsRepositoryProvider);
    return repo.update(preset);
  }

  Future<void> deletePreset(Preset preset) {
    final repo = ref.read(presetsRepositoryProvider);
    return repo.delete(preset);
  }
}

// @riverpod
// class Presets extends _$Presets {
//   @override
//   Future<List<Preset>> build() async {
//     final repository = ref.watch(presetRepositoryProvider);
//     return repository.getAll();
//   }

//   Future<void> addPreset(Preset preset) async {
//     final repository = ref.read(presetRepositoryProvider);
//     await repository.save(preset);
//     ref.invalidateSelf();
//   }

//   Future<void> updatePreset(Preset preset) async {
//     final repository = ref.read(presetRepositoryProvider);
//     await repository.save(preset);
//     ref.invalidateSelf();
//   }

//   Future<void> deletePreset(String id) async {
//     final repository = ref.read(presetRepositoryProvider);
//     await repository.delete(id);
//     ref.invalidateSelf();
//   }

//   Future<void> duplicatePreset(Preset preset) async {
//     final newPreset = preset.copyWith(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: '${preset.name} (Copy)',
//     );
//     await addPreset(newPreset);
//   }
// }

// @riverpod
// class PresetFilter extends _$PresetFilter {
//   @override
//   PresetCategory? build() => null;

//   void setFilter(PresetCategory? category) {
//     state = category;
//   }
// }

// @riverpod
// class PresetSearchQuery extends _$PresetSearchQuery {
//   @override
//   String build() => '';

//   void setQuery(String query) {
//     state = query;
//   }
// }

// @riverpod
// List<Preset> filteredPresets(Ref ref) {
//   final presetsAsync = ref.watch(presetsProvider);
//   final filter = ref.watch(presetFilterProvider);
//   final searchQuery = ref.watch(presetSearchQueryProvider);

//   return presetsAsync.when(
//     data: (List<Preset> presets) {
//       var filtered = presets;

//       // Apply category filter
//       if (filter != null) {
//         filtered = filtered.where((Preset p) => p.category == filter).toList();
//       }

//       // Apply search filter
//       if (searchQuery.isNotEmpty) {
//         final query = searchQuery.toLowerCase();
//         filtered = filtered.where((Preset p) {
//           return p.name.toLowerCase().contains(query) ||
//               p.description.toLowerCase().contains(query) ||
//               p.ffmpegCommand.toLowerCase().contains(query);
//         }).toList();
//       }

//       return filtered;
//     },
//     loading: () => <Preset>[],
//     error: (_, __) => <Preset>[],
//   );
// }

// enum PresetViewMode { grid, list }

// @riverpod
// class PresetViewModeNotifier extends _$PresetViewModeNotifier {
//   @override
//   PresetViewMode build() => PresetViewMode.grid;

//   void toggle() {
//     state = state == PresetViewMode.grid
//         ? PresetViewMode.list
//         : PresetViewMode.grid;
//   }
// }
