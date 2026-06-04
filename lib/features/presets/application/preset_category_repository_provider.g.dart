// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_category_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(presetCategoryRepository)
final presetCategoryRepositoryProvider = PresetCategoryRepositoryProvider._();

final class PresetCategoryRepositoryProvider
    extends
        $FunctionalProvider<
          PresetCategoryRepository,
          PresetCategoryRepository,
          PresetCategoryRepository
        >
    with $Provider<PresetCategoryRepository> {
  PresetCategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presetCategoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presetCategoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<PresetCategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PresetCategoryRepository create(Ref ref) {
    return presetCategoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PresetCategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PresetCategoryRepository>(value),
    );
  }
}

String _$presetCategoryRepositoryHash() =>
    r'901121b00a1ccd0ba15d38293221f046e3464fc3';
