// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets_query_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(presetsQuery)
final presetsQueryProvider = PresetsQueryFamily._();

final class PresetsQueryProvider
    extends
        $FunctionalProvider<
          AsyncValue<Iterable<Preset>>,
          Iterable<Preset>,
          Stream<Iterable<Preset>>
        >
    with $FutureModifier<Iterable<Preset>>, $StreamProvider<Iterable<Preset>> {
  PresetsQueryProvider._({
    required PresetsQueryFamily super.from,
    required PresetsQueryArguments super.argument,
  }) : super(
         retry: null,
         name: r'presetsQueryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$presetsQueryHash();

  @override
  String toString() {
    return r'presetsQueryProvider'
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
    return presetsQuery(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PresetsQueryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$presetsQueryHash() => r'd9ae84594fc0f749a40f0589189d7c954b25a6b7';

final class PresetsQueryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<Iterable<Preset>>,
          PresetsQueryArguments
        > {
  PresetsQueryFamily._()
    : super(
        retry: null,
        name: r'presetsQueryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PresetsQueryProvider call(PresetsQueryArguments args) =>
      PresetsQueryProvider._(argument: args, from: this);

  @override
  String toString() => r'presetsQueryProvider';
}
