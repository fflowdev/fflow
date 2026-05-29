import 'package:fflow/core/notification/domain/app_notification_item.dart';
import 'package:fflow/core/notification/domain/app_notification_type.dart';
import 'package:fflow/core/notification/presentation/app_notification_builder.dart';
import 'package:fflow/core/router/presentation/shell_route_scaffold.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugPage extends HookConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShellRouteScaffold(
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
          ListTile(
            title: const Text('Test App Notification'),
            onTap: () {
              final notification = context.notification;
              notification.push(
                AppNotificationItem(
                  content: 'Test content(${notification.notifications.length})',
                  type:
                      AppNotificationType.values[notification
                              .notifications
                              .length %
                          AppNotificationType.values.length],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
