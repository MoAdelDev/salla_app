import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (!_sharedPreferences.containsKey('token')) {
      _sharedPreferences.setString('token', '');
    }
  }

  static String get token => _sharedPreferences.getString('token') ?? '';

  static Future<bool> saveToken(String token) async {
    return await _sharedPreferences.setString('token', token);
  }
}
