import 'package:fflow/core/settings/data/app_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AppSettingsRepository appSettingsRepository(Ref ref) => AppSettingsRepository();
