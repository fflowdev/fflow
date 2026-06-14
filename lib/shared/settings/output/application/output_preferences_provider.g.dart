// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_preferences_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OutputPreferencesNotifier)
final outputPreferencesProvider = OutputPreferencesNotifierProvider._();

final class OutputPreferencesNotifierProvider
    extends $NotifierProvider<OutputPreferencesNotifier, OutputPreferences> {
  OutputPreferencesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'outputPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outputPreferencesNotifierHash();

  @$internal
  @override
  OutputPreferencesNotifier create() => OutputPreferencesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OutputPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OutputPreferences>(value),
    );
  }
}

String _$outputPreferencesNotifierHash() =>
    r'0e5bd93d8fada2f22828dea6bc0a90c4b00af366';

abstract class _$OutputPreferencesNotifier
    extends $Notifier<OutputPreferences> {
  OutputPreferences build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OutputPreferences, OutputPreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OutputPreferences, OutputPreferences>,
              OutputPreferences,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
