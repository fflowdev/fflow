import 'package:fflow/features/home_shell/presentation/widgets/home_shell_scaffold.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeShellScaffold(title: 'Queue', body: ListView());
  }
}
