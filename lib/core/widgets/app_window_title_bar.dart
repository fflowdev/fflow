import 'dart:async';

import 'package:fflow/core/theme/extentions/navigation_theme.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_titlebar/windows_titlebar.dart';

class AppWindowTitleBar extends StatefulWidget implements PreferredSizeWidget {
  const AppWindowTitleBar({super.key});

  @override
  State<AppWindowTitleBar> createState() => _AppWindowTitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kWindowTitleBarHeight);
}

class _AppWindowTitleBarState extends State<AppWindowTitleBar>
    with WindowListener {
  late final ValueNotifier<FutureOr<bool>> _isMaximized;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _isMaximized = ValueNotifier(windowManager.isMaximized());
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() {
    _isMaximized.value = true;
  }

  @override
  void onWindowUnmaximize() {
    _isMaximized.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = switch (Theme.brightnessOf(context)) {
      Brightness.light => const WindowButtonColor.light(),
      Brightness.dark => const WindowButtonColor.dark(),
    };
    final closeButtonColor = switch (Theme.brightnessOf(context)) {
      Brightness.light => const WindowButtonColor.closeLight(),
      Brightness.dark => const WindowButtonColor.closeDark(),
    };
    const animated = true;

    return SizedBox.fromSize(
      size: widget.preferredSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.navigationTheme.backgroundColor,
          border: Border(
            bottom: BorderSide(color: context.theme.dividerColor),
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              child: DragToMoveArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('FFlow'),
                ),
              ),
            ),

            WindowButton.minimize(
              buttonColor: buttonColor,
              animated: animated,
              onTap: windowManager.minimize,
            ),
            ValueListenableBuilder(
              valueListenable: _isMaximized,
              builder: (context, isMaximized, child) {
                Widget builder({required bool isMaximized}) {
                  return isMaximized
                      ? WindowButton.unmaximize(
                          buttonColor: buttonColor,
                          animated: animated,
                          onTap: windowManager.unmaximize,
                        )
                      : WindowButton.maximize(
                          buttonColor: buttonColor,
                          animated: animated,
                          onTap: windowManager.maximize,
                        );
                }

                final isMaximizedFutureOr = isMaximized;
                if (isMaximizedFutureOr is bool) {
                  return builder(isMaximized: isMaximizedFutureOr);
                }

                return FutureBuilder(
                  future: isMaximizedFutureOr,
                  builder: (context, snapshot) {
                    final isMaximized = snapshot.data ?? false;
                    return builder(isMaximized: isMaximized);
                  },
                );
              },
            ),
            WindowButton.close(
              buttonColor: closeButtonColor,
              animated: animated,
              onTap: windowManager.close,
            ),
          ],
        ),
      ),
    );
  }
}
