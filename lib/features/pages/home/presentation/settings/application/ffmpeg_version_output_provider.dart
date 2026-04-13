import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/features/pages/home/presentation/settings/data/check_ffmpeg_version.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ffmpeg_version_output_provider.freezed.dart';
part 'ffmpeg_version_output_provider.g.dart';

@freezed
abstract class FfmpegVersionOutputResult with _$FfmpegVersionOutputResult {
  const factory FfmpegVersionOutputResult({
    required String output,
    required int exitCode,
  }) = _FfmpegVersionOutputResult;
  const FfmpegVersionOutputResult._();

  bool get isSuccess => exitCode == 0;
}

@riverpod
class FfmpegVersionOutputNotifier extends _$FfmpegVersionOutputNotifier {
  @override
  Future<FfmpegVersionOutputResult?> build() async {
    return null;
  }

  Future<AsyncValue<FfmpegVersionOutputResult?>> run(String ffmpegPath) async {
    state = const AsyncValue.loading();
    return state = await AsyncValue.guard(() async {
      logger.d('Running FFmpeg version check for path: $ffmpegPath');
      final result = await runCheckFFmpegVersion(ffmpegPath);
      return FfmpegVersionOutputResult(
        output: result.stdout as String,
        exitCode: result.exitCode,
      );
    });
  }
}
