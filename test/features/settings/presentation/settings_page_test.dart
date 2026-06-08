import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/core/theme/app_theme.dart';
import 'package:fflow/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await storage.initialize();
  });

  testWidgets('updates max concurrent tasks from settings', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: _testTheme(),
          home: const SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Max concurrent tasks'), findsOneWidget);
    expect(container.read(appSettingsProvider).maxConcurrentTasks, 1);

    await tester.tap(find.text('4'));
    await tester.pumpAndSettle();

    expect(container.read(appSettingsProvider).maxConcurrentTasks, 4);
  });
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
