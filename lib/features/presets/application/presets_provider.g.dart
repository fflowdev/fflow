// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchPresets)
final watchPresetsProvider = WatchPresetsFamily._();

final class WatchPresetsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Iterable<Preset>>,
          Iterable<Preset>,
          Stream<Iterable<Preset>>
        >
    with $FutureModifier<Iterable<Preset>>, $StreamProvider<Iterable<Preset>> {
  WatchPresetsProvider._({
    required WatchPresetsFamily super.from,
    required PresetsQueryArguments super.argument,
  }) : super(
         retry: null,
         name: r'watchPresetsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchPresetsHash();

  @override
  String toString() {
    return r'watchPresetsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Iterable<Preset>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Iterable<Preset>> create(Ref ref) {
    final argument = this.argument as PresetsQueryArguments;
    return watchPresets(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPresetsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchPresetsHash() => r'affa0412e97127a7f1b29b9e8f6115dbda56ce75';

final class WatchPresetsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<Iterable<Preset>>,
          PresetsQueryArguments
        > {
  WatchPresetsFamily._()
    : super(
        retry: null,
        name: r'watchPresetsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchPresetsProvider call(PresetsQueryArguments args) =>
      WatchPresetsProvider._(argument: args, from: this);

  @override
  String toString() => r'watchPresetsProvider';
}
