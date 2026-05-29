import 'dart:io';

import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/extension/iterable_extension.dart';
import 'package:fflow/core/theme/extentions/settings_page_theme.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/core/widgets/app_dialog.dart';
import 'package:fflow/core/router/presentation/shell_route_scaffold.dart';
import 'package:fflow/features/settings/application/ffmpeg_version_output_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'settings_page.freezed.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.read(appSettingsProvider);
    final ffmpegPathTextEditingController = useTextEditingController(
      text: appSettings.ffmpegPath,
    );
    final outputDiretoryPathTextEditingController = useTextEditingController(
      text: appSettings.outputDiretoryPath,
    );
    useEffect(() {
      void listener() {
        ref
            .read(appSettingsProvider.notifier)
            .updateFFmpegPath(ffmpegPathTextEditingController.text);
      }

      ffmpegPathTextEditingController.addListener(listener);
      return () => ffmpegPathTextEditingController.removeListener(listener);
    }, [ffmpegPathTextEditingController]);
    useEffect(() {
      void listener() {
        ref
            .read(appSettingsProvider.notifier)
            .updateOutputDirectoryPath(
              outputDiretoryPathTextEditingController.text,
            );
      }

      outputDiretoryPathTextEditingController.addListener(listener);
      return () =>
          outputDiretoryPathTextEditingController.removeListener(listener);
    }, [outputDiretoryPathTextEditingController]);
    Future<void> onTapPickFFmpegExecutable() async {
      final result = await FilePicker.pickFiles(
        allowedExtensions: Platform.isWindows ? ['exe'] : null,
        type: Platform.isWindows ? FileType.custom : FileType.any,
      );
      final ffmpegFile = result?.files.single;
      if (ffmpegFile == null) {
        logger.i('FFmpeg executable picking was cancelled');
        return;
      }
      final ffmpegPath = ffmpegFile.path;
      if (ffmpegPath == null) {
        logger.w('Picked FFmpeg executable has no path');
        return;
      }
      logger.i('Picked FFmpeg executable path: $ffmpegPath');
      ffmpegPathTextEditingController.text = ffmpegPath;
    }

    Future<void> onTapCheckFfmpegVersion() async {
      final ffmpegPath = ffmpegPathTextEditingController.text;
      final asyncValue = await ref
          .read(ffmpegVersionOutputProvider.notifier)
          .run(ffmpegPath);
      await asyncValue.when(
        data: (result) async {
          if (result == null) {
            logger.w(
              'FFmpeg version check result is null',
            );
          } else {
            await AppDialog(
              title: Text(
                result.isSuccess
                    ? 'FFmpeg Version Check Succeeded'
                    : 'FFmpeg Version Check Failed',
              ),
              content: SingleChildScrollView(
                child: Text(result.output),
              ),
              scrollable: true,
            ).show<void>(context);
          }
        },
        error: (e, s) {
          logger.e(
            'Error while checking FFmpeg version',
            error: e,
            stackTrace: s,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to check FFmpeg version',
              ),
            ),
          );
        },
        loading: () {},
      );
    }

    Future<void> onTapPickOutputDirectory() async {
      final directoryPath = await FilePicker.getDirectoryPath();
      if (directoryPath == null) {
        logger.i('Output directory picking was cancelled');
        return;
      }
      logger.i('Picked output directory path: $directoryPath');
      outputDiretoryPathTextEditingController.text = directoryPath;
    }

    return ShellRouteScaffold(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        children: <Widget>[
          _ListTileGroup(
            name: 'Appearance',
            listTiles: [
              _ListTile.preset(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Adjust the interface preference',
                trailing: Consumer(
                  builder: (context, ref, child) {
                    final currentThemeMode = ref.watch(
                      appSettingsProvider.select(
                        (state) => state.themeSettings.themeMode,
                      ),
                    );
                    return SegmentedButton(
                      showSelectedIcon: false,
                      segments: ThemeMode.values
                          .map(
                            (e) => ButtonSegment(
                              value: e,
                              label: switch (e) {
                                ThemeMode.system => const Text('System'),
                                ThemeMode.light => const Text('Light'),
                                ThemeMode.dark => const Text('Dark'),
                              },
                            ),
                          )
                          .toList(),
                      onSelectionChanged: (newSelection) {
                        if (newSelection.isEmpty) return;
                        ref
                            .read(appSettingsProvider.notifier)
                            .updateThemeMode(newSelection.first);
                      },
                      selected: {
                        currentThemeMode,
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          _ListTileGroup(
            name: 'FFmpeg Configuration',
            listTiles: [
              _ListTile.custom(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 16,
                  children: [
                    TextField(
                      controller: ffmpegPathTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'FFmpeg Executable Path',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.folder_open),
                          onPressed: onTapPickFFmpegExecutable,
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final ffmpegVersionOutputAsync = ref.watch(
                          ffmpegVersionOutputProvider,
                        );
                        final onPressed = switch (ffmpegVersionOutputAsync) {
                          AsyncLoading() => null,
                          _ => onTapCheckFfmpegVersion,
                        };
                        return TextButton.icon(
                          onPressed: onPressed,
                          label: const Text('Check Version'),
                          icon: const Icon(Icons.play_arrow),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          _ListTileGroup(
            name: 'Output Preferences',
            listTiles: [
              _ListTile.custom(
                child: TextField(
                  controller: outputDiretoryPathTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Default Output Directory',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.folder_open),
                      onPressed: onTapPickOutputDirectory,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _ListTileGroup(
            name: 'Notifications',
            listTiles: [
              _ListTile.preset(
                onTap: () {},
                icon: Icons.notifications_outlined,
                title: 'System Notifications',
                subtitle: 'Show system notifications',
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
            ],
          ),
        ].joinWith(const Gap(24)).toList(),
      ),
    );
  }
}

@freezed
sealed class _ListTile with _$ListTile {
  const factory _ListTile.preset({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) = _PresetListTile;

  const factory _ListTile.custom({
    VoidCallback? onTap,
    required Widget child,
  }) = _CustomListTile;
}

class _ListTileBuilder extends StatelessWidget {
  const _ListTileBuilder({
    required this.listTile,
    required this.borderRadius,
  });

  final _ListTile listTile;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final listTile = this.listTile;
    final tileStyle = context.settingsPageTheme.tileTheme;

    return Material(
      color: tileStyle.backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: listTile.onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: switch (listTile) {
            _CustomListTile() => listTile.child,
            _PresetListTile() => Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: tileStyle.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      listTile.icon,
                      size: 20,
                      color: tileStyle.iconColor,
                    ),
                  ),
                ),
                const Gap(16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listTile.title,
                      style: tileStyle.titleTextStyle,
                    ),
                    if (listTile.subtitle != null)
                      Text(
                        listTile.subtitle!,
                        style: tileStyle.subtitleTextStyle,
                      ),
                  ],
                ),
                const Spacer(),
                ?listTile.trailing,
              ],
            ),
          },
        ),
      ),
    );
  }
}

class _ListTileGroup extends StatelessWidget {
  const _ListTileGroup({this.name, required this.listTiles});

  final String? name;
  final List<_ListTile> listTiles;

  @override
  Widget build(BuildContext context) {
    final pageTheme = context.settingsPageTheme;
    final tileStyle = pageTheme.tileTheme;
    final divider = Divider(
      height: 1,
      thickness: 1,
      color: tileStyle.dividerColor,
    );
    final radius = tileStyle.borderRadius;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(name!, style: pageTheme.tileGroupTitleTextStyle),
          ),

        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: listTiles.length > 1
                ? listTiles
                      .map<Widget>((tile) {
                        final isFirst = tile == listTiles.first;
                        final isLast = tile == listTiles.last;
                        final borderRadius = BorderRadius.vertical(
                          top: isFirst ? radius : Radius.zero,
                          bottom: isLast ? radius : Radius.zero,
                        );
                        return _ListTileBuilder(
                          listTile: tile,
                          borderRadius: borderRadius,
                        );
                      })
                      .joinWith(divider)
                      .toList()
                : listTiles
                      .map(
                        (tile) => _ListTileBuilder(
                          listTile: tile,
                          borderRadius: BorderRadius.all(radius),
                        ),
                      )
                      .toList(),
          ),
        ),
      ],
    );
  }
}
