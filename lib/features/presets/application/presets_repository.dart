import 'package:fflow/features/presets/data/presets_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_repository.g.dart';

@riverpod
PresetsRepository presetsRepository(Ref ref) => PresetsRepository();
