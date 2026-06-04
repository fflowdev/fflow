import 'package:fflow/features/presets/application/presets_repository.dart';
import 'package:fflow/features/presets/domain/preset.dart';
import 'package:fflow/features/presets/domain/presets_query_arguments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_query_provider.g.dart';

@riverpod
Stream<Iterable<Preset>> presetsQuery(
  Ref ref,
  PresetsQueryArguments args,
) {
  final repo = ref.watch(presetsRepositoryProvider);
  return repo.watchByCategoryAndKeyword(
    category: args.category?.name,
    keyword: args.queryName,
  );
}
