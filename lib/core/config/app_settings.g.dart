// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  ffmpegPath: json['ffmpegPath'] as String?,
  ffprobePath: json['ffprobePath'] as String?,
  themeSettings: ThemeSettings.fromJson(
    json['themeSettings'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'ffmpegPath': instance.ffmpegPath,
      'ffprobePath': instance.ffprobePath,
      'themeSettings': instance.themeSettings,
    };

_ThemeSettings _$ThemeSettingsFromJson(Map<String, dynamic> json) =>
    _ThemeSettings(
      primaryColor: const ColorConverter().fromJson(
        (json['primaryColor'] as num).toInt(),
      ),
      usePlatformSeedColor: json['usePlatformSeedColor'] as bool,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
    );

Map<String, dynamic> _$ThemeSettingsToJson(_ThemeSettings instance) =>
    <String, dynamic>{
      'primaryColor': const ColorConverter().toJson(instance.primaryColor),
      'usePlatformSeedColor': instance.usePlatformSeedColor,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppSettingsNotifier)
final appSettingsProvider = AppSettingsNotifierProvider._();

final class AppSettingsNotifierProvider
    extends $NotifierProvider<AppSettingsNotifier, AppSettings> {
  AppSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsNotifierHash();

  @$internal
  @override
  AppSettingsNotifier create() => AppSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettings>(value),
    );
  }
}

String _$appSettingsNotifierHash() =>
    r'bd0403c0032a1c42d24766d20ddc86465344ff18';

abstract class _$AppSettingsNotifier extends $Notifier<AppSettings> {
  AppSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppSettings, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSettings, AppSettings>,
              AppSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
