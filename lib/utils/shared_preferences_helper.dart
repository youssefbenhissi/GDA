// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const PASSWORD_STRING = "PASSWORD_STRING";
  static const LOGIN_STRING = "LOGIN_STRING";

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setValue(String key, dynamic value) async {
    await init();
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    }
  }

  static dynamic getValue(String key) async {
    await init();
    return _preferences.get(key);
  }
}
