import 'package:fflow/core/notification/domain/app_notification_config.dart';
import 'package:fflow/core/notification/domain/app_notification_item.dart';
import 'package:fflow/core/notification/domain/app_notification_manager.dart';
import 'package:fflow/core/notification/presentation/app_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppNotificationBuilder extends StatefulWidget {
  const AppNotificationBuilder({
    super.key,
    required this.config,
    required this.child,
  });

  final AppNotificationConfig config;
  final Widget child;

  static TransitionBuilder inject({
    AppNotificationConfig config = const AppNotificationConfig(),
    TransitionBuilder? builder,
  }) {
    return (context, child) {
      final app =
          builder?.call(context, child) ?? child ?? const SizedBox.shrink();

      return AppNotificationBuilder(
        config: config,
        child: app,
      );
    };
  }

  @override
  State<AppNotificationBuilder> createState() => _AppNotificationBuilderState();
}

class _AppNotificationBuilderState extends State<AppNotificationBuilder> {
  late AppNotificationManager _manager = _createManager(widget.config);

  AppNotificationManager _createManager(AppNotificationConfig config) {
    return AppNotificationManager(
      maxCount: config.maxCount,
      defaultDuration: config.defaultDuration,
    );
  }

  @override
  void didUpdateWidget(covariant AppNotificationBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config.maxCount != widget.config.maxCount ||
        oldWidget.config.defaultDuration != widget.config.defaultDuration) {
      _manager.dispose();
      _manager = _createManager(widget.config);
    }
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppNotification._(
      config: widget.config,
      manager: _manager,
      child: Stack(
        children: [
          widget.child,
          const _AppNotificationOverlay(),
        ],
      ),
    );
  }
}

class AppNotification extends InheritedWidget {
  const AppNotification._({
    required AppNotificationConfig config,
    required AppNotificationManager manager,
    required super.child,
  }) : _config = config,
       _manager = manager;

  final AppNotificationConfig _config;
  final AppNotificationManager _manager;
  List<AppNotificationItem> get notifications => _manager.notifications;

  static AppNotification of(BuildContext context) {
    final notification = context
        .dependOnInheritedWidgetOfExactType<AppNotification>();
    assert(notification != null, 'No AppNotification found in context');
    return notification!;
  }

  void push(AppNotificationItem item) {
    _manager.push(item);
  }

  @override
  bool updateShouldNotify(AppNotification oldWidget) {
    return oldWidget._config != _config;
  }
}

extension AppNotificationMixin on BuildContext {
  AppNotification get notification => AppNotification.of(this);
}

class _AppNotificationOverlay extends HookWidget {
  const _AppNotificationOverlay();

  @override
  Widget build(BuildContext context) {
    final appNotification = AppNotification.of(context);
    final config = appNotification._config;
    final manager = appNotification._manager;
    final notifications = useListenable(manager).notifications;
    const cardHeight = 80.0;
    const cardWidth = 300.0;
    final len = notifications.length;
    const padding = 24.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;

        // 使定位在右边
        final rect = Rect.fromLTRB(
          size.width - cardWidth - padding,
          0,
          size.width - padding,
          size.height,
        );

        return Stack(
          children: [
            Positioned.fromRect(
              rect: rect,
              child: Stack(
                children: List.generate(len, (index) {
                  // The notifications are ordered from the newest (top) to the
                  // oldest (bottom).
                  final item = notifications[index];
                  final rank = len - index - 1;
                  final sizeOffset = config.stepSizeOffset(rank);
                  final positionOffset = config.stepPositionOffset(rank);
                  final width = cardWidth + sizeOffset.dx;
                  final height = cardHeight + sizeOffset.dy;

                  final centerOffset = Offset(
                    rect.width / 2,
                    rect.height - cardHeight / 2 - padding + positionOffset.dy,
                  );
                  final cardRect = RelativeRect.fromSize(
                    Rect.fromCenter(
                      center: centerOffset,
                      width: width,
                      height: height,
                    ),
                    rect.size,
                  );

                  return AppNotificationCard(
                    key: ObjectKey(item),
                    item: item,
                    rect: cardRect,
                    duration: item.duration ?? config.defaultDuration,
                    animationDuration: config.animationDuration,
                    animationCurve: config.animationCurve,
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
