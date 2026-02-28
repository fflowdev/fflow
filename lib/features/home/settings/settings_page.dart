import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/extension/iterable_extension.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
              _SectionItem.listTile(
                icon: const Icon(Icons.contrast),
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

class _SectionItem extends StatelessWidget {
  const _SectionItem({required this.child, this.icon, this.onTap});
  factory _SectionItem.listTile({
    required Widget title,
    Widget? subtitle,
    Widget? icon,
    Widget? trailing,
    GestureTapCallback? onTap,
  }) {
    return _SectionItem(
      icon: icon,
      onTap: onTap,
      child: Builder(
        builder: (context) {
          final titleTextStyle = context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
          );
          final subtitleTextStyle = context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w300,
          );

          var titleWidget = title;
          if (titleTextStyle != null) {
            titleWidget = DefaultTextStyle(
              style: titleTextStyle,
              child: titleWidget,
            );
          }

          var subtitleWidget = subtitle;
          if (subtitleWidget != null && subtitleTextStyle != null) {
            subtitleWidget = DefaultTextStyle(
              style: subtitleTextStyle,
              child: subtitleWidget,
            );
          }

          return Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: titleWidget),
                  if (subtitleWidget != null) ...[
                    const Gap(4),
                    Flexible(child: subtitleWidget),
                  ],
                ],
              ),

              if (trailing != null) ...[
                const Spacer(),
                Flexible(flex: 0, child: trailing),
              ],
            ],
          );
        },
      ),
    );
  }

  final Widget child;
  final Widget? icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    if (icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: icon,
            ),
          ),
          const Gap(16),
          Expanded(child: child),
        ],
      );
    }

    return Material(
      color: Colors.transparent,
      borderRadius: _kSectionBorderRadius,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
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
          ...items
              .map<Widget>((e) => _SectionItemBuilder(item: e))
              .joinWith(
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

class _SectionItemBuilder extends StatelessWidget {
  const _SectionItemBuilder({required this.item});

  final _SectionItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: item.child,
      ),
    );
  }
}
