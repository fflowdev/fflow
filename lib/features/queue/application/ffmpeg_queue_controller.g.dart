// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffmpeg_queue_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(queueProcessControllerFactory)
final queueProcessControllerFactoryProvider =
    QueueProcessControllerFactoryProvider._();

final class QueueProcessControllerFactoryProvider
    extends
        $FunctionalProvider<
          FfmpegProcessControllerFactory,
          FfmpegProcessControllerFactory,
          FfmpegProcessControllerFactory
        >
    with $Provider<FfmpegProcessControllerFactory> {
  QueueProcessControllerFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueProcessControllerFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueProcessControllerFactoryHash();

  @$internal
  @override
  $ProviderElement<FfmpegProcessControllerFactory> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FfmpegProcessControllerFactory create(Ref ref) {
    return queueProcessControllerFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FfmpegProcessControllerFactory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FfmpegProcessControllerFactory>(
        value,
      ),
    );
  }
}

String _$queueProcessControllerFactoryHash() =>
    r'7086ca603aca4976b010800ed43e6d0a99128c44';

@ProviderFor(FfmpegQueueController)
final ffmpegQueueControllerProvider = FfmpegQueueControllerProvider._();

final class FfmpegQueueControllerProvider
    extends $NotifierProvider<FfmpegQueueController, FfmpegQueueState> {
  FfmpegQueueControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ffmpegQueueControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ffmpegQueueControllerHash();

  @$internal
  @override
  FfmpegQueueController create() => FfmpegQueueController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FfmpegQueueState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FfmpegQueueState>(value),
    );
  }
}

String _$ffmpegQueueControllerHash() =>
    r'493a9fe1fb254778e5e51a6e2bec4d22e770241b';

abstract class _$FfmpegQueueController extends $Notifier<FfmpegQueueState> {
  FfmpegQueueState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FfmpegQueueState, FfmpegQueueState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FfmpegQueueState, FfmpegQueueState>,
              FfmpegQueueState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
