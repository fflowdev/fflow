import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/pages/home/presentation/home_shell_scaffold.dart';
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
            title: const Text('Clear Settings'),
            onTap: storage.clear,
          ),
        ],
      ),
    );
  }
}
