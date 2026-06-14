import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_kv.freezed.dart';

@freezed
abstract class AppSettingsKV<T> with _$AppSettingsKV<T> {
  const factory AppSettingsKV({
    required String key,
    required T value,
  }) = _AppSettingsKV<T>;
}
