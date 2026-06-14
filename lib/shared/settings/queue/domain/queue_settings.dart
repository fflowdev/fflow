import 'package:fflow/core/json/json_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_settings.freezed.dart';
part 'queue_settings.g.dart';

@freezed
abstract class QueueSettings with _$QueueSettings {
  const factory QueueSettings({
    required int maxConcurrentTasks,
  }) = _QueueSettings;

  factory QueueSettings.def() => const QueueSettings(maxConcurrentTasks: 2);

  factory QueueSettings.fromJson(Json json) => _$QueueSettingsFromJson(json);
}
