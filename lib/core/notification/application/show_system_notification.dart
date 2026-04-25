import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initSystemNotificationPlugin() async {
  const initializationSettingsDarwin = DarwinInitializationSettings();
  const initializationSettingsLinux = LinuxInitializationSettings(
    defaultActionName: 'Open notification',
  );
  const initializationSettingsWindows = WindowsInitializationSettings(
    appName: 'Flutter Local Notifications Example',
    appUserModelId: 'Com.Dexterous.FlutterLocalNotificationsExample',
    guid: '3bc00fda-0352-4893-b77d-a00455e68666',
  );
  const initializationSettings = InitializationSettings(
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
    windows: initializationSettingsWindows,
  );
  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
  );
}
