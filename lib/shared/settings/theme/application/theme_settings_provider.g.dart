// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeSettingsNotifier)
final themeSettingsProvider = ThemeSettingsNotifierProvider._();

final class ThemeSettingsNotifierProvider
    extends $NotifierProvider<ThemeSettingsNotifier, ThemeSettings> {
  ThemeSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeSettingsNotifierHash();

  @$internal
  @override
  ThemeSettingsNotifier create() => ThemeSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeSettings>(value),
    );
  }
}

String _$themeSettingsNotifierHash() =>
    r'c89d8d89afcf65276edcb6de2adaa105c8d66e55';

abstract class _$ThemeSettingsNotifier extends $Notifier<ThemeSettings> {
  ThemeSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeSettings, ThemeSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeSettings, ThemeSettings>,
              ThemeSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
