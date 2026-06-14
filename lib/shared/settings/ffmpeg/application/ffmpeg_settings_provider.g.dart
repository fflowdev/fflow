// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffmpeg_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FfmpegSettingsNotifier)
final ffmpegSettingsProvider = FfmpegSettingsNotifierProvider._();

final class FfmpegSettingsNotifierProvider
    extends $NotifierProvider<FfmpegSettingsNotifier, FfmpegSettings> {
  FfmpegSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ffmpegSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ffmpegSettingsNotifierHash();

  @$internal
  @override
  FfmpegSettingsNotifier create() => FfmpegSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FfmpegSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FfmpegSettings>(value),
    );
  }
}

String _$ffmpegSettingsNotifierHash() =>
    r'33d2dcd71d2be0061f501ec925f9da377432cefb';

abstract class _$FfmpegSettingsNotifier extends $Notifier<FfmpegSettings> {
  FfmpegSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FfmpegSettings, FfmpegSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FfmpegSettings, FfmpegSettings>,
              FfmpegSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
