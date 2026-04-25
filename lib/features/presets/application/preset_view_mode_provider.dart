import 'package:fflow/features/presets/domain/preset_view_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_view_mode_provider.g.dart';

@riverpod
class PresetViewModeNotifier extends _$PresetViewModeNotifier {
  @override
  PresetViewMode build() => PresetViewMode.grid;

  void toggle() {
    state = state == PresetViewMode.grid
        ? PresetViewMode.list
        : PresetViewMode.grid;
  }
}
