import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<void> setBoolean({
    required String key,
    required bool value,
  }) async =>
      await sharedPreferences.setBool(key, value);

  static bool? getBoolean({required String key}) => sharedPreferences.getBool(key);
}
