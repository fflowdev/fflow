// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(presetCategories)
final presetCategoriesProvider = PresetCategoriesProvider._();

final class PresetCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Iterable<PresetCategory>>,
          Iterable<PresetCategory>,
          Stream<Iterable<PresetCategory>>
        >
    with
        $FutureModifier<Iterable<PresetCategory>>,
        $StreamProvider<Iterable<PresetCategory>> {
  PresetCategoriesProvider._()
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
  String debugGetCreateSourceHash() => _$presetCategoriesHash();

  @$internal
  @override
  $StreamProviderElement<Iterable<PresetCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Iterable<PresetCategory>> create(Ref ref) {
    return presetCategories(ref);
  }
}

String _$presetCategoriesHash() => r'779deab2f4a8c608d1742c1eed658412c84c0c6b';
