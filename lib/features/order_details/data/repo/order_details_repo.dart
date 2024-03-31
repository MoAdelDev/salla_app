import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/features/orders/data/models/order_cancellation_response_body.dart';

class OrderDetailsRepo {
  final ApiService _apiService;

  OrderDetailsRepo(this._apiService);

  Future<ApiResult<OrderDetailsResponseBody>> getOrderDetails(
      int orderId) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.getOrderDetails(token, orderId);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message ?? '');
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<OrderCacnellationResponseBody>> cancelOrder(
      int orderId) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.cancelOrder(token, orderId);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message ?? '');
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
