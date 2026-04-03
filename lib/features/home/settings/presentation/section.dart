import 'package:fflow/core/extension/iterable_extension.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const _kSectionBorderRadius = BorderRadius.all(Radius.circular(16));

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.title, required this.items});

  final String title;
  final List<SectionItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        const Gap(16),
        _SectionItemsContainer(items: items),
      ],
    );
  }
}

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? icon;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    final titleTextStyle = context.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w400,
    );
    final subtitleTextStyle = context.textTheme.titleSmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w300,
    );

    var title = this.title;
    if (titleTextStyle != null) {
      title = DefaultTextStyle(
        style: titleTextStyle,
        child: title,
      );
    }

    var subtitle = this.subtitle;
    if (subtitle != null && subtitleTextStyle != null) {
      subtitle = DefaultTextStyle(
        style: subtitleTextStyle,
        child: subtitle,
      );
    }

    final trailing = this.trailing;

    widget = Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: title),
            if (subtitle != null) ...[
              const Gap(4),
              Flexible(child: subtitle),
            ],
          ],
        ),

        if (trailing != null) ...[
          const Spacer(),
          Flexible(flex: 0, child: trailing),
        ],
      ],
    );

    if (icon != null) {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surfaceContainerHighest,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: icon,
            ),
          ),
          const Gap(16),
          Expanded(child: widget),
        ],
      );
    }

    if (onTap != null) {
      widget = InkWell(
        borderRadius: _kSectionBorderRadius,
        onTap: onTap,
        child: widget,
      );
    }

    return _SectionItemContainer(child: widget);
  }
}

class FilePickSectionItem extends StatelessWidget {
  const FilePickSectionItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return _SectionItemContainer(
      child: Column(
        children: [TextField(decoration: InputDecoration(label: Text(title)))],
      ),
    );
  }
}

class _SectionItemContainer extends StatelessWidget {
  const _SectionItemContainer({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: _kSectionBorderRadius,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 48,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class _SectionItemsContainer extends StatelessWidget {
  const _SectionItemsContainer({required this.items});

  final List<SectionItem> items;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: _kSectionBorderRadius,
        side: BorderSide(
          color: context.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...items.cast<Widget>().joinWith(
            const Divider(
              height: 0,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
