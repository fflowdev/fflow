import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class HomeShellScaffold extends StatelessWidget {
  const HomeShellScaffold({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleBar(title: title),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.onSurface,
        ),
      ),
    );
  }
}
