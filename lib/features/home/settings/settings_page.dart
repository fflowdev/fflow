import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/theme/theme_extension.dart';
import 'package:fflow/features/home/settings/presentation/section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

          SettingsSection(
            title: 'Appearance',
            items: [
              SectionItem(
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
