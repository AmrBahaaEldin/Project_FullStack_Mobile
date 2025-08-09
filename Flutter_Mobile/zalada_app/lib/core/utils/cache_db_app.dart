import 'package:shared_preferences/shared_preferences.dart';

class CacheApp {
  CacheApp._();
  static SharedPreferences?
  sharedPreferences; // single instance of shared preferences

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // return String or int or double or bool is respon in call function type data dynmaic
  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
