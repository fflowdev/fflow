import 'dart:convert';

import 'package:fflow/core/config/app_settings.dart';
import 'package:fflow/core/json/json_typedef.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = Storage();

abstract class _Storage {
  @protected
  SharedPreferences? __prefs;
  SharedPreferences get _prefs {
    assert(
      __prefs != null,
      'Storage not initialized. Call initialize() first.',
    );
    return __prefs!;
  }

  Future<void> initialize() async {
    __prefs = await SharedPreferences.getInstance();
  }

  T? _getDecodeJson<T>(String key, T Function(Json) fromJson) {
    final jsonString = _prefs.getString(key);
    if (jsonString == null) return null;
    final json = jsonDecode(jsonString);
    if (json is! Json) return null;
    return fromJson(json);
  }
}

class Storage extends _Storage with _AppSettingsStorage {
  Storage();
}

mixin _AppSettingsStorage on _Storage {
  static const _key = 'app_settings';

  Future<bool> saveAppSettings(AppSettings settings) {
    return _prefs.setString(_key, jsonEncode(settings.toJson()));
  }

  AppSettings? getAppSettings() => _getDecodeJson(_key, AppSettings.fromJson);
}
