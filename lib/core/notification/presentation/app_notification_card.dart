import 'dart:async';

import 'package:fflow/core/notification/domain/app_notification_item.dart';
import 'package:flutter/material.dart';

/// TODO(Noo6): 拥有创建和移除动画，且在位置发生变化时能够平滑过渡的通知卡片
class AppNotificationCard extends StatefulWidget {
  const AppNotificationCard({
    super.key,
    required this.rect,
    required this.item,
    required this.duration,
    this.animationCurve = Curves.easeInOut,
    required this.animationDuration,
  }) : assert(duration > Duration.zero, 'duration must be greater than zero'),
       assert(
         duration > animationDuration,
         'duration must be greater than animationDuration',
       );

  final RelativeRect rect;
  final AppNotificationItem item;
  final Duration duration;
  final Curve animationCurve;
  final Duration animationDuration;

  @override
  State<AppNotificationCard> createState() => _AppNotificationCardState();
}

class _AppNotificationCardState extends State<AppNotificationCard>
    with TickerProviderStateMixin {
  late final AnimationController _createController;
  late final AnimationController _removeController;
  Animatable<RelativeRect>? _rectAnimatable;

  @override
  void initState() {
    super.initState();
    _createController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _removeController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    unawaited(_playCreateAnimation());
  }

  @override
  void didUpdateWidget(AppNotificationCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.rect != widget.rect && _rectAnimatable != null) {
      final currentRect = _rectAnimatable!.evaluate(_createController);
      _rectAnimatable = RelativeRectTween(
        begin: currentRect,
        end: widget.rect,
      ).chain(CurveTween(curve: widget.animationCurve));
      unawaited(_createController.forward(from: 0));
    }
  }

  @override
  void dispose() {
    _createController.dispose();
    _removeController.dispose();
    super.dispose();
  }

  Future<void> _playCreateAnimation() => _createController.forward();

  Future<void> _playRemoveAnimation() => _removeController.forward();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        return Stack(
          children: [
            PositionedTransition(
              rect: _createController.drive(
                _rectAnimatable ??=
                    RelativeRectTween(
                      begin: widget.rect.shift(Offset(0, size.height)),
                      end: widget.rect,
                    ).chain(
                      CurveTween(curve: widget.animationCurve),
                    ),
              ),
              child: FadeTransition(
                opacity: _removeController.drive(
                  Tween<double>(begin: 1, end: 0).chain(
                    CurveTween(curve: widget.animationCurve),
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 4,
                  child: InkWell(
                    onTap: widget.item.onTap,
                    child: Column(
                      children: [
                        if (widget.item.title?.isNotEmpty ?? false)
                          Text(widget.item.title!),
                        Text(widget.item.content),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
