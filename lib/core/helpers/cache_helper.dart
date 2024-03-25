import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  CacheHelper._();
  static late FlutterSecureStorage secureStorage;
  static Future<void> init() async {
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    const iOSOptions = IOSOptions();

    secureStorage = FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iOSOptions,
    );
  }

  static Future<String> get token async =>
      await secureStorage.read(key: 'token') ?? '';

  static Future<void> saveToken(String token) async {
    return await secureStorage.write(key: 'token', value: token);
  }

  static Future<void> saveString(
      {required String key, required String value}) async {
    return await secureStorage.write(key: key, value: value);
  }

  static Future<String> getString({required String key}) async =>
      await secureStorage.read(key: key) ?? '';
}
