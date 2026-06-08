import 'dart:io';

import 'package:ffmpeg_cli/ffmpeg_cli.dart';

typedef FfmpegProcessStarter = Future<Process> Function(FfmpegCommand command);

class CliFfmpegProcessService {
  const CliFfmpegProcessService();

  Future<Process> call(FfmpegCommand command) {
    return Ffmpeg().run(command);
  }
}
