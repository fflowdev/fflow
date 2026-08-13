import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_parser.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/features/queue/application/ffmpeg_queue_controller.dart';
import 'package:fflow/features/queue/presentation/widgets/create_queue_task_dialog.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CreateQueueTaskUseCase {
  const CreateQueueTaskUseCase({
    required this.queueController,
  });

  final FfmpegQueueController queueController;

  Future<void> execute({required BuildContext context}) async {
    final formData = await const CreateQueueTaskDialog().show(context);
    if (formData == null) {
      logger.d('CreateQueueTaskUseCase: User canceled the dialog');
      return;
    }

    final args = [
      if (formData.preset != null)
        ...const FfmpegCliArgumentParser().parse(
          formData.preset!.ffmpegArguments,
        ),
      ...const FfmpegCliArgumentParser().parse(formData.additionalArgs),
      if (formData.overwriteOutput) const CliArg(name: 'y'),
    ];

    final outputFilepath = join(
      formData.outputDirectory,
      formData.outputFileName,
    );

    queueController.enqueueSimpleTask(
      ffmpegPath: formData.ffmpegPath,
      inputPath: formData.inputPath,
      outputFilepath: outputFilepath,
      label: formData.label,
      args: args,
    );
  }
}
