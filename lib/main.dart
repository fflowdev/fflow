import 'dart:async';

import 'package:fflow/app.dart';
import 'package:fflow/core/provider/root_provider_container.dart';
import 'package:fflow/core/settings/application/app_settings_provider.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await runZonedGuarded(
    () async {
      FlutterError.onError = (FlutterErrorDetails details) {
        logger.e(
          'Uncaught Flutter error',
          error: details.exception,
          stackTrace: details.stack,
        );
      };
      WidgetsFlutterBinding.ensureInitialized();

      await _initializePresists();
      await _initializeWindow();

      return runApp(
        UncontrolledProviderScope(
          container: rootProviderContainer,
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      logger.e('Uncaught error in main', error: error, stackTrace: stackTrace);
    },
  );
}

Future<void> _initializePresists() async {
  // Preload settings before the app starts to ensure they're available
  // immediately.
  await rootProviderContainer.read(appPreloadSettingsProvider.future);
}

Future<void> _initializeWindow() async {
  final windowOptions = WindowOptions(
    size: const Size(1080, 667),
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: useCustomWindowTitleBar
        ? TitleBarStyle.hidden
        : TitleBarStyle.normal,
  );

  await windowManager.ensureInitialized();
  unawaited(
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    }),
  );
}
