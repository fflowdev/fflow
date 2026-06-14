import 'dart:convert';

import 'package:fflow/core/json/json_typedef.dart';
import 'package:fflow/core/settings/application/app_settings_provider.dart';
import 'package:fflow/shared/settings/queue/domain/queue_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queue_settings_provider.g.dart';

final AppSettingsNotifierProvider<String, QueueSettings>
_queueSettingsProvider = appSettingsProvider(
  AppSettingsNotifierArguments<String, QueueSettings>(
    key: 'queueSettings',
    valueBuilder: (json) => QueueSettings.fromJson(jsonDecode(json) as Json),
    dataBuilder: (value) => jsonEncode(value.toJson()),
  ),
);

@Riverpod(keepAlive: true)
class QueueSettingsNotifier extends _$QueueSettingsNotifier {
  @override
  QueueSettings build() {
    return ref.watch(_queueSettingsProvider).value ?? QueueSettings.def();
  }

  void setMaxConcurrentTasks(int maxConcurrentTasks) {
    final newState = state.copyWith(maxConcurrentTasks: maxConcurrentTasks);
    ref.read(_queueSettingsProvider.notifier).setValue(newState);
  }
}
