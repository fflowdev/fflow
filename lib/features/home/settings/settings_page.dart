import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/extension/iterable_extension.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _kSectionBorderRadius = BorderRadius.all(Radius.circular(16));

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettingsNotifier = ref.read(appSettingsProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: ListView(
        children: [
          Text('Settings', style: context.textTheme.headlineMedium),

          _Section(
            title: 'Appearance',
            items: [
              _SectionItem(
                icon: const Icon(
                  Icons.contrast,
                  size: 18,
                ),
                title: const Text('Theme mode'),
                subtitle: const Text('Adjust the interface appearance'),
                trailing: Consumer(
                  builder: (context, ref, child) {
                    String getLabel(ThemeMode mode) => switch (mode) {
                      ThemeMode.system => 'System',
                      ThemeMode.light => 'Light',
                      ThemeMode.dark => 'Dark',
                    };

                    final themeMode = ref
                        .read(appSettingsProvider)
                        .themeSettings
                        .themeMode;
                    final items = ThemeMode.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(getLabel(e)),
                          ),
                        )
                        .toList();

                    return DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        value: themeMode,
                        items: items,
                        onChanged: (value) {
                          if (value != null) {
                            appSettingsNotifier.updateThemeMode(value);
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 42,
                          width: 140,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.colorScheme.outlineVariant,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: context.colorScheme.surfaceContainerHigh,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.colorScheme.secondaryContainer,
                          ),
                          offset: const Offset(0, -8),
                          scrollbarTheme: const ScrollbarThemeData(
                            radius: Radius.circular(40),
                            thickness: WidgetStatePropertyAll(6),
                            thumbVisibility: WidgetStatePropertyAll(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
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

class _SectionItem extends StatelessWidget {
  const _SectionItem({
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

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.items});

  final String title;
  final List<_SectionItem> items;

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

class _SectionItemsContainer extends StatelessWidget {
  const _SectionItemsContainer({required this.items});

  final List<_SectionItem> items;

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
