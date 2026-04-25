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
          AsyncValue<List<PresetCategory>>,
          List<PresetCategory>,
          FutureOr<List<PresetCategory>>
        >
    with
        $FutureModifier<List<PresetCategory>>,
        $FutureProvider<List<PresetCategory>> {
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
  $FutureProviderElement<List<PresetCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PresetCategory>> create(Ref ref) {
    return presetCategories(ref);
  }
}

String _$presetCategoriesHash() => r'051669e858222147195ae01b747968cac4093949';
