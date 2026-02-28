import 'dart:async';

import 'package:fflow/app.dart';
import 'package:fflow/core/provider/root_provider_container.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await storage.initialize();

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
