// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_appPreloadSettings)
final _appPreloadSettingsProvider = _AppPreloadSettingsProvider._();

final class _AppPreloadSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Object>>,
          Map<String, Object>,
          FutureOr<Map<String, Object>>
        >
    with
        $FutureModifier<Map<String, Object>>,
        $FutureProvider<Map<String, Object>> {
  _AppPreloadSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_appPreloadSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_appPreloadSettingsHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, Object>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Object>> create(Ref ref) {
    return _appPreloadSettings(ref);
  }
}

String _$_appPreloadSettingsHash() =>
    r'5ebf09fb4e42c0cedb48ee7ea6ca23d07a55ccfd';

@ProviderFor(AppPreloadSettingsNotifier)
final appPreloadSettingsProvider = AppPreloadSettingsNotifierProvider._();

final class AppPreloadSettingsNotifierProvider
    extends $AsyncNotifierProvider<AppPreloadSettingsNotifier, void> {
  AppPreloadSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPreloadSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPreloadSettingsNotifierHash();

  @$internal
  @override
  AppPreloadSettingsNotifier create() => AppPreloadSettingsNotifier();
}

String _$appPreloadSettingsNotifierHash() =>
    r'c6cfb9082b25922b40f525a66fe1c206e6b55f44';

abstract class _$AppPreloadSettingsNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AppSettingsNotifier)
final appSettingsProvider = AppSettingsNotifierFamily._();

final class AppSettingsNotifierProvider<DataT extends Object, ValueT>
    extends $AsyncNotifierProvider<AppSettingsNotifier<DataT, ValueT>, ValueT> {
  AppSettingsNotifierProvider._({
    required AppSettingsNotifierFamily super.from,
    required AppSettingsNotifierArguments<DataT, ValueT> super.argument,
  }) : super(
         retry: null,
         name: r'appSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appSettingsNotifierHash();

  @override
  String toString() {
    return r'appSettingsProvider'
        '<${DataT}, ${ValueT}>'
        '($argument)';
  }

  @$internal
  @override
  AppSettingsNotifier<DataT, ValueT> create() =>
      AppSettingsNotifier<DataT, ValueT>();

  $R _captureGenerics<$R>($R Function<DataT extends Object, ValueT>() cb) {
    return cb<DataT, ValueT>();
  }

  @override
  bool operator ==(Object other) {
    return other is AppSettingsNotifierProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$appSettingsNotifierHash() =>
    r'c129693c31d052c2e89a83074bcfba1d67d38cd8';

final class AppSettingsNotifierFamily extends $Family {
  AppSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'appSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AppSettingsNotifierProvider<DataT, ValueT> call<DataT extends Object, ValueT>(
    AppSettingsNotifierArguments<DataT, ValueT> args,
  ) => AppSettingsNotifierProvider<DataT, ValueT>._(argument: args, from: this);

  @override
  String toString() => r'appSettingsProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    AppSettingsNotifier<DataT, ValueT> Function<DataT extends Object, ValueT>()
    create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as AppSettingsNotifierProvider;
      return provider._captureGenerics(<DataT extends Object, ValueT>() {
        provider as AppSettingsNotifierProvider<DataT, ValueT>;
        return provider
            .$view(create: create<DataT, ValueT>)
            .$createElement(pointer);
      });
    },
  );

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
    FutureOr<ValueT> Function<DataT extends Object, ValueT>(
      Ref ref,
      AppSettingsNotifier<DataT, ValueT> notifier,
    )
    build,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as AppSettingsNotifierProvider;
      return provider._captureGenerics(<DataT extends Object, ValueT>() {
        provider as AppSettingsNotifierProvider<DataT, ValueT>;
        return provider
            .$view(runNotifierBuildOverride: build<DataT, ValueT>)
            .$createElement(pointer);
      });
    },
  );
}

abstract class _$AppSettingsNotifier<DataT extends Object, ValueT>
    extends $AsyncNotifier<ValueT> {
  late final _$args = ref.$arg as AppSettingsNotifierArguments<DataT, ValueT>;
  AppSettingsNotifierArguments<DataT, ValueT> get args => _$args;

  FutureOr<ValueT> build(AppSettingsNotifierArguments<DataT, ValueT> args);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ValueT>, ValueT>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ValueT>, ValueT>,
              AsyncValue<ValueT>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
