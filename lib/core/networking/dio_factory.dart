import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? instance;

  static Future<Dio> getInstance() async {
    const Duration timeout = Duration(seconds: 60);
    if (instance == null) {
      final String languageCode = await CacheHelper.language;
      BaseOptions baseOptions = BaseOptions(
        receiveTimeout: timeout,
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': languageCode == 'ar' ? 'ar' : 'en',
        },
      );
      instance = Dio(baseOptions);
    }
    _addInterceptors();
    return instance!;
  }

  static Future<Dio> getPaymentInstance() async {
    const Duration timeout = Duration(seconds: 60);
    if (instance == null) {
      BaseOptions baseOptions = BaseOptions(
        receiveTimeout: timeout,
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveDataWhenStatusError: true,
      );
      instance = Dio(baseOptions);
    }
    _addInterceptors();
    return instance!;
  }

  static void _addInterceptors() {
    instance!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
