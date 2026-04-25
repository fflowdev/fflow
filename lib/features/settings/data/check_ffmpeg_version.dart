import 'dart:io';

Future<ProcessResult> runCheckFFmpegVersion(String ffmpegPath) {
  return Process.run(ffmpegPath, ['-version']);
}
