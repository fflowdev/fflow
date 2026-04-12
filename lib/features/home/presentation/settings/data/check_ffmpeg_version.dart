import 'dart:io';

import 'package:fflow/core/utils/logger.dart';

Future<ProcessResult> runCheckFFmpegVersion(String ffmpegPath) {
  logger.d('Checking FFmpeg version with path: $ffmpegPath');
  return Process.run(ffmpegPath, ['-version']);
}
