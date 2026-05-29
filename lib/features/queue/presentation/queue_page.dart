import 'package:fflow/core/router/presentation/shell_route_scaffold.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShellRouteScaffold(title: 'Queue', body: ListView());
  }
}
