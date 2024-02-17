import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? instance;

  static Future<Dio> getInstance() async {
    const Duration timeout = Duration(seconds: 60);
    if (instance == null) {
      BaseOptions baseOptions = BaseOptions(
        receiveTimeout: timeout,
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveDataWhenStatusError: true,
      );
      _addInterceptors();
      instance = Dio(baseOptions);
    }
    return instance!;
  }

  static void _addInterceptors() {
    instance!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );
  }
}
