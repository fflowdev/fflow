// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_view_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PresetViewModeNotifier)
final presetViewModeProvider = PresetViewModeNotifierProvider._();

final class PresetViewModeNotifierProvider
    extends $NotifierProvider<PresetViewModeNotifier, PresetViewMode> {
  PresetViewModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presetViewModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presetViewModeNotifierHash();

  @$internal
  @override
  PresetViewModeNotifier create() => PresetViewModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PresetViewMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PresetViewMode>(value),
    );
  }
}

String _$presetViewModeNotifierHash() =>
    r'6a6e497c29eb8066af437665b315bf8fc59c15fa';

abstract class _$PresetViewModeNotifier extends $Notifier<PresetViewMode> {
  PresetViewMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PresetViewMode, PresetViewMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PresetViewMode, PresetViewMode>,
              PresetViewMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
