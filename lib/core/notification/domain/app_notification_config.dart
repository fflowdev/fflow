import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification_config.freezed.dart';

double getSequenceValueAt(
  int n, {
  double start = -20.0,
  double initialDelta = -7.0,
  double decay = 0.7,
}) {
  if (n == 0) return start;
  final totalChange = initialDelta * (1 - pow(decay, n)) / (1 - decay);
  return start + totalChange;
}

Offset _defaultStepSizeOffset(int rank) {
  if (rank == 0) return Offset.zero;
  final ratio = Curves.easeInQuint.transform((rank + 1) / 5);
  const start = Offset(-20, 0);
  const end = Offset(-30, 0);
  return start - (start - end) * ratio;
}

Offset _defaultStepPositionOffset(int rank) {
  if (rank == 0) return Offset.zero;
  final ratio = Curves.easeInQuint.transform((rank + 1) / 5);
  const start = Offset(0, -20);
  const end = Offset(0, -80);
  return start - (start - end) * ratio;
}

@freezed
abstract class AppNotificationConfig with _$AppNotificationConfig {
  const factory AppNotificationConfig({
    @Default(5) int maxCount,
    @Default(_defaultStepSizeOffset) Offset Function(int rank) stepSizeOffset,
    @Default(_defaultStepPositionOffset)
    Offset Function(int rank) stepPositionOffset,
    @Default(Duration(seconds: 3)) Duration defaultDuration,
    @Default(Duration(milliseconds: 300)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
  }) = _AppNotificationConfig;
}
