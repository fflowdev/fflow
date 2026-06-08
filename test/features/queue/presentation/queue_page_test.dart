import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/theme/app_theme.dart';
import 'package:fflow/features/queue/presentation/queue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets(
    'shows queue metrics in the bottom bar instead of the top header',
    (
      tester,
    ) async {
      final container = ProviderContainer(
        overrides: [
          appSettingsProvider.overrideWithValue(
            AppSettings(
              ffmpegPath: null,
              ffprobePath: null,
              outputDiretoryPath: null,
              maxConcurrentTasks: 3,
              themeSettings: ThemeSettings.def(),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            theme: _testTheme(),
            home: const QueuePage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Task Queue'), findsNothing);
      expect(find.text('Max concurrent tasks'), findsNothing);
      expect(find.text('0 of 3 slots in use.'), findsOneWidget);
      expect(find.text('Running'), findsOneWidget);
      expect(find.text('Queued'), findsOneWidget);
      expect(find.text('Succeeded'), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
      expect(find.text('Canceled'), findsOneWidget);
    },
  );
}

ThemeData _testTheme() {
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  final darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );
  return AppTheme(
    colorScheme: colorScheme,
    darkColorScheme: darkColorScheme,
  ).theme;
}
