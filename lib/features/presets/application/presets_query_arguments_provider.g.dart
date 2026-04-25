// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_query_arguments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PresetsQueryArgumentsNotifier)
final presetsQueryArgumentsProvider = PresetsQueryArgumentsNotifierProvider._();

final class PresetsQueryArgumentsNotifierProvider
    extends
        $NotifierProvider<
          PresetsQueryArgumentsNotifier,
          PresetsQueryArguments
        > {
  PresetsQueryArgumentsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presetsQueryArgumentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presetsQueryArgumentsNotifierHash();

  @$internal
  @override
  PresetsQueryArgumentsNotifier create() => PresetsQueryArgumentsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PresetsQueryArguments value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PresetsQueryArguments>(value),
    );
  }
}

String _$presetsQueryArgumentsNotifierHash() =>
    r'480ab4d880321ac78839aac916a491a365869b62';

abstract class _$PresetsQueryArgumentsNotifier
    extends $Notifier<PresetsQueryArguments> {
  PresetsQueryArguments build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PresetsQueryArguments, PresetsQueryArguments>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PresetsQueryArguments, PresetsQueryArguments>,
              PresetsQueryArguments,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
