// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PresetCategoriesNotifier)
final presetCategoriesProvider = PresetCategoriesNotifierProvider._();

final class PresetCategoriesNotifierProvider
    extends
        $StreamNotifierProvider<
          PresetCategoriesNotifier,
          Iterable<PresetCategory>
        > {
  PresetCategoriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presetCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presetCategoriesNotifierHash();

  @$internal
  @override
  PresetCategoriesNotifier create() => PresetCategoriesNotifier();
}

String _$presetCategoriesNotifierHash() =>
    r'ceee03e453e34213d6dc8721ea44cbafcd50916a';

abstract class _$PresetCategoriesNotifier
    extends $StreamNotifier<Iterable<PresetCategory>> {
  Stream<Iterable<PresetCategory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Iterable<PresetCategory>>,
              Iterable<PresetCategory>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Iterable<PresetCategory>>,
                Iterable<PresetCategory>
              >,
              AsyncValue<Iterable<PresetCategory>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
