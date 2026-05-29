import 'package:fflow/core/theme/app_theme.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class ShellRouteScaffold extends StatelessWidget {
  const ShellRouteScaffold({
    super.key,
    required this.title,
    this.titleBarActions,
    required this.body,
  });

  final String title;
  final List<Widget>? titleBarActions;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appThemeData.surface,
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleBar(title: title, actions: titleBarActions),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        ...?actions?.map((action) => Flexible(flex: 0, child: action)),
      ],
    );
  }
}
