import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesManager {
  static late SharedPreferences sharedPreferences;

  static Future<void >init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveStringData(String key, String data) async {
    return sharedPreferences.setString(key, data);
  }

  static Future<String?> getStringData(String key) async {
    return sharedPreferences.getString(key);
  }
}
