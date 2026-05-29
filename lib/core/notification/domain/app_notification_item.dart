import 'dart:collection';
import 'dart:ui';

import 'package:fflow/core/notification/domain/app_notification_type.dart';

final class AppNotificationItem extends LinkedListEntry<AppNotificationItem> {
  AppNotificationItem({
    this.title,
    required this.content,
    required this.type,
    this.duration,
    this.onTap,
  });

  final String? title;
  final String content;
  final AppNotificationType type;
  final Duration? duration;
  final VoidCallback? onTap;
}
