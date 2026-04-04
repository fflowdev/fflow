import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:fflow/core/router/router.dart';
import 'package:fflow/core/theme/app_theme.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(
      appSettingsProvider.select((s) => s.themeSettings),
    );

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (themeSettings.usePlatformSeedColor &&
            lightDynamic != null &&
            darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: themeSettings.primaryColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: themeSettings.primaryColor,
            brightness: Brightness.dark,
          );
        }

        final appTheme = AppTheme(
          colorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
        );

        return MaterialApp.router(
          title: 'FFlow',
          theme: appTheme.theme,
          darkTheme: appTheme.darkTheme,
          themeMode: themeSettings.themeMode,
          routerConfig: router,
        );
      },
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ffmpegPath = useState<String?>(null);
    final inputFile = useState<File?>(null);
    final outputPath = useState<String?>(null);
    final outputFileName = useTextEditingController(text: 'output.mp4');
    final runner = useState<FfmpegRunner?>(null);
    useEffect(() {
      return runner.value?.dispose;
    }, [runner.value]);

    Future<void> selectFFmpeg() async {
      final result = await FilePicker.pickFiles();
      if (result != null && result.files.single.path != null) {
        ffmpegPath.value = result.files.single.path;
      }
    }

    Future<void> selectInputFile() async {
      final result = await FilePicker.pickFiles();
      if (result != null && result.files.single.path != null) {
        inputFile.value = File(result.files.single.path!);
      }
    }

    Future<void> selectOutputPath() async {
      final result = await FilePicker.getDirectoryPath();
      if (result != null) {
        outputPath.value = result;
      }
    }

    final enabled = useMemoized(
      () =>
          ffmpegPath.value != null &&
          inputFile.value != null &&
          outputPath.value != null &&
          outputFileName.text.isNotEmpty,
      [
        ffmpegPath.value,
        inputFile.value,
        outputPath.value,
        outputFileName.text,
      ],
    );

    Future<void> startProcessing() async {
      if (!enabled) return;
      var runner1 = runner.value;
      runner1 = runner.value = FfmpegRunner(
        FfmpegCommand.simple(
          ffmpegPath: ffmpegPath.value,
          inputs: [FfmpegInput.asset(inputFile.value!.path)],
          args: [
            const CliArg(name: 'progress', value: 'pipe:1'),
            const CliArg(name: 'y'),
          ],
          outputFilepath: '${outputPath.value!}/${outputFileName.text.trim()}',
        ),
      );
      await runner1.run();
    }

    Future<void> stopProcessing() async {
      runner.value?.stop();
      runner.value = null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: selectFFmpeg,
              child: Text(ffmpegPath.value ?? 'Select FFmpeg'),
            ),
            ElevatedButton(
              onPressed: selectInputFile,
              child: Text(
                inputFile.value?.path.split('/').last ?? 'Select Input File',
              ),
            ),
            ElevatedButton(
              onPressed: selectOutputPath,
              child: Text(
                outputPath.value?.split('/').last ?? 'Select Output Path',
              ),
            ),
            TextField(
              controller: outputFileName,
              decoration: const InputDecoration(labelText: 'Output File Name'),
            ),
            ElevatedButton(
              onPressed: enabled ? startProcessing : null,
              child: const Text('Start Processing'),
            ),
            ElevatedButton(
              onPressed: runner.value != null ? stopProcessing : null,
              child: const Text('Stop Processing'),
            ),
            StreamBuilder(
              stream: runner.value?.progressStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final progress = snapshot.data!;
                  return Text(progress.toString());
                } else {
                  return const Text('No progress yet');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
