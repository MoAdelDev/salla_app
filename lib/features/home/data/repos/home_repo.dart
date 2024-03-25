import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/home/data/models/user_response_body.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<UserResponseBody>> getUser() async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.getUser(token);
      if (response.status) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message ?? '');
      }
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
