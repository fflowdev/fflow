import 'dart:async';

import 'package:fflow/app.dart';
import 'package:fflow/core/provider/root_provider_container.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:fflow/shared/settings/theme/application/theme_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  await storage.initialize();

  // Preload theme settings to ensure the app has the necessary data before
  // building the UI.
  await rootProviderContainer.read(themeSettingsProvider.notifier).preload();
}
