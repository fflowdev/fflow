// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QueueSettingsNotifier)
final queueSettingsProvider = QueueSettingsNotifierProvider._();

final class QueueSettingsNotifierProvider
    extends $NotifierProvider<QueueSettingsNotifier, QueueSettings> {
  QueueSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueSettingsNotifierHash();

  @$internal
  @override
  QueueSettingsNotifier create() => QueueSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueSettings>(value),
    );
  }
}

String _$queueSettingsNotifierHash() =>
    r'b158d876a4b713b4114bd128fedc0193d5a31bc9';

abstract class _$QueueSettingsNotifier extends $Notifier<QueueSettings> {
  QueueSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<QueueSettings, QueueSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QueueSettings, QueueSettings>,
              QueueSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
