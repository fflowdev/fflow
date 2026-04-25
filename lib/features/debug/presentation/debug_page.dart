import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/home_shell/presentation/widgets/home_shell_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugPage extends HookConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeShellScaffold(
      title: 'Debug',
      body: ListView(
        children: [
          ListTile(
            title: const Text('Clear Shared Preferences'),
            onTap: storage.clearSharedPreferences,
          ),
          ListTile(
            title: const Text('Clear Database'),
            onTap: storage.clearDatabase,
          ),
        ],
      ),
    );
  }
}
