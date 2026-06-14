// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'06cf00003d873d2aa5e3ff8abec5efbfd68f83a2';

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
