import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static late final SharedPreferences _sharedPreferences;

  static void init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  static int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  static Future<void> setObject(String key, Object object) async {
    await _sharedPreferences.setString(key, jsonEncode(object));
  }

  static dynamic getObject(String key) {
    String? objectJson = _sharedPreferences.getString(key);

    if (objectJson != null) {
      try {
        return jsonDecode(objectJson);
      } catch (_) {}
    }

    return null;
  }

  static void emptyString(String key) async {
    await _sharedPreferences.setString(key, '');
  }

  static void emptyObject(String key) async {
    await _sharedPreferences.setString(key, '');
  }

  static Future<void> clearAll() async {
    await _sharedPreferences.clear();
  }

  static Future<void> clear(String key) async {
    await _sharedPreferences.remove(key);
  }

  static bool containsKey(String key) => _sharedPreferences.containsKey(key);

  static bool notContainsKey(String key) => !_sharedPreferences.containsKey(key);
}