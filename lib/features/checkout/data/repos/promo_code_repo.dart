import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/checkout/data/models/promo_code_response.dart';

class PromoCodeRepo {
  final ApiService _apiService;

  PromoCodeRepo(this._apiService);

  Future<ApiResult<PromoCodeResponse>> applyPromoCode() async {
    final String token = CacheHelper.token;
    try {
      final response = await _apiService.applyPromoCode(token);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
