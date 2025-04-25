import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtil {
  static const String _lastPromptDateKey = 'lastPromptDate';
  static const String _isDarkModeKey = 'isDarkMode';

  static Future<void> saveLastPromptDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastPromptDateKey, date.toIso8601String());
  }

  static Future<DateTime?> getLastPromptDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateString = prefs.getString(_lastPromptDateKey);
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }

  static Future<bool> hasLastPromptDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_lastPromptDateKey);
  }

  static Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, isDarkMode);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkModeKey) ?? false;
  }
}
