// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(presetsRepository)
final presetsRepositoryProvider = PresetsRepositoryProvider._();

final class PresetsRepositoryProvider
    extends
        $FunctionalProvider<
          PresetsRepository,
          PresetsRepository,
          PresetsRepository
        >
    with $Provider<PresetsRepository> {
  PresetsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presetsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presetsRepositoryHash();

  @$internal
  @override
  $ProviderElement<PresetsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PresetsRepository create(Ref ref) {
    return presetsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PresetsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PresetsRepository>(value),
    );
  }
}

String _$presetsRepositoryHash() => r'812a97e4d9da48f52c440163048216199b29dc11';
