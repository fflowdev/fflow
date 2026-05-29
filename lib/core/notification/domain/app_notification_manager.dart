import 'dart:collection';

import 'package:fflow/core/notification/domain/app_notification_item.dart';
import 'package:flutter/material.dart';

class AppNotificationManager with ChangeNotifier {
  AppNotificationManager({
    required this.maxCount,
    required this.defaultDuration,
  }) : assert(maxCount > 0, 'maxCount must be greater than 0');

  final int maxCount;
  final Duration defaultDuration;
  final _notifications = LinkedList<AppNotificationItem>();

  List<AppNotificationItem> get notifications => _notifications.toList();

  void push(AppNotificationItem item) {
    while (_notifications.length >= maxCount) {
      _notifications.first.unlink();
    }
    _notifications.add(item);
    Future.delayed(item.duration ?? defaultDuration, () {
      if (item.list != null) {
        item.unlink();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void popFirst() {
    if (_notifications.isNotEmpty) {
      _notifications.first.unlink();
      notifyListeners();
    }
  }

  void popAll() {
    if (_notifications.isNotEmpty) {
      while (_notifications.isNotEmpty) {
        _notifications.first.unlink();
      }
      notifyListeners();
    }
  }
}
