// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffmpeg_version_output_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FfmpegVersionOutputNotifier)
final ffmpegVersionOutputProvider = FfmpegVersionOutputNotifierProvider._();

final class FfmpegVersionOutputNotifierProvider
    extends
        $AsyncNotifierProvider<
          FfmpegVersionOutputNotifier,
          FfmpegVersionOutputResult?
        > {
  FfmpegVersionOutputNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ffmpegVersionOutputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ffmpegVersionOutputNotifierHash();

  @$internal
  @override
  FfmpegVersionOutputNotifier create() => FfmpegVersionOutputNotifier();
}

String _$ffmpegVersionOutputNotifierHash() =>
    r'75e20fb16bdfec1598b3f9eead6124ce0c27df0e';

abstract class _$FfmpegVersionOutputNotifier
    extends $AsyncNotifier<FfmpegVersionOutputResult?> {
  FutureOr<FfmpegVersionOutputResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<FfmpegVersionOutputResult?>,
              FfmpegVersionOutputResult?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<FfmpegVersionOutputResult?>,
                FfmpegVersionOutputResult?
              >,
              AsyncValue<FfmpegVersionOutputResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
