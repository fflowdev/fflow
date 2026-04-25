import 'package:fflow/core/settings/app_settings.dart';
import 'package:fflow/core/storage/storage.dart';

class AppSettingsRepository extends SharePreferencesRepository<AppSettings> {
  AppSettingsRepository()
    : super(
        'app_settings',
        jsonHandler: RepositoryJsonHandler(
          fromJson: AppSettings.fromJson,
          toJson: (settings) => settings.toJson(),
        ),
      );
}
