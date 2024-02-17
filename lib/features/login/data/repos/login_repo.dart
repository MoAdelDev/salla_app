import 'package:dio/dio.dart';
import 'package:salla_app/core/networking/api_error_model.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<ApiResult> login(LoginRequestBody loginRequestBody) async {
    try {
      final result = await apiService.login(loginRequestBody);
      if (result.status) {
        return ApiResult.success(result);
      }
      return ApiResult.failure(
        ApiErrorModel(
          status: result.status,
          message: result.message,
        ),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          status: false,
          message: e.message ?? '',
        ),
      );
    }
  }
}
