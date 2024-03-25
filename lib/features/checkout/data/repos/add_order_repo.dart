import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/checkout/data/models/add_order_request_body.dart';
import 'package:salla_app/features/checkout/data/models/add_order_response_body.dart';

class AddOrderRepo {
  final ApiService _apiService;

  AddOrderRepo(this._apiService);

  Future<ApiResult<AddOrderResponseBody>> addOrder(
      AddOrderRequestBody addOrderRequestBody) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.addOrder(
        token,
        addOrderRequestBody,
      );
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
