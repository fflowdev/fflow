import 'package:dynamic_color/dynamic_color.dart';
import 'package:fflow/core/constants/app_constants.dart';
import 'package:fflow/core/router/application/router.dart';
import 'package:fflow/core/theme/app_theme.dart';
import 'package:fflow/core/widgets/app_window_title_bar.dart';
import 'package:fflow/features/settings/application/theme_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsProvider);

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
          builder: (context, child) => child == null
              ? const SizedBox.shrink()
              : kUseCustomWindowTitleBar
              ? _VirtualWindowFrame(child: child)
              : child,
        );
      },
    );
  }
}

class _VirtualWindowFrame extends StatelessWidget {
  const _VirtualWindowFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VirtualWindowFrame(
      child: Column(
        children: [
          const Material(
            type: MaterialType.transparency,
            child: AppWindowTitleBar(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
