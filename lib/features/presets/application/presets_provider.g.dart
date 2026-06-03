// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PresetsNotifier)
final presetsProvider = PresetsNotifierFamily._();

final class PresetsNotifierProvider
    extends $StreamNotifierProvider<PresetsNotifier, Iterable<Preset>> {
  PresetsNotifierProvider._({
    required PresetsNotifierFamily super.from,
    required PresetsQueryArguments super.argument,
  }) : super(
         retry: null,
         name: r'presetsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$presetsNotifierHash();

  @override
  String toString() {
    return r'presetsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PresetsNotifier create() => PresetsNotifier();

  @override
  bool operator ==(Object other) {
    return other is PresetsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$presetsNotifierHash() => r'12fcbf84a95e0d7d9f402e41e5bb477e148f13c6';

final class PresetsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PresetsNotifier,
          AsyncValue<Iterable<Preset>>,
          Iterable<Preset>,
          Stream<Iterable<Preset>>,
          PresetsQueryArguments
        > {
  PresetsNotifierFamily._()
    : super(
        retry: null,
        name: r'presetsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PresetsNotifierProvider call(PresetsQueryArguments args) =>
      PresetsNotifierProvider._(argument: args, from: this);

  @override
  String toString() => r'presetsProvider';
}

abstract class _$PresetsNotifier extends $StreamNotifier<Iterable<Preset>> {
  late final _$args = ref.$arg as PresetsQueryArguments;
  PresetsQueryArguments get args => _$args;

  Stream<Iterable<Preset>> build(PresetsQueryArguments args);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Iterable<Preset>>, Iterable<Preset>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Iterable<Preset>>, Iterable<Preset>>,
              AsyncValue<Iterable<Preset>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
