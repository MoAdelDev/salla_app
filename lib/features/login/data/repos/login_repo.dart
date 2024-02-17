import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_error_model.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      if (response.status) {
        await CacheHelper.saveToken(response.data?.token ?? '');
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(
          status: response.status,
          message: response.message,
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
