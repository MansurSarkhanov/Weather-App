import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<void> setString(String key, String object) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, object);
  }

  Future<void> setBool(String key, bool object) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, object);
  }

  Future<bool> getBool(
    String key,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
