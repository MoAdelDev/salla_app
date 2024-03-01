import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/data/models/cart_update_request.dart';
import 'package:salla_app/features/cart/data/models/cart_update_response.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<CartResponseBody>> getCart() async {
    final String token = CacheHelper.token;
    try {
      final response = await _apiService.getCart(token);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message ?? '');
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<CartUpdateResponse>> updateCart(
      int cartId, CartUpdateRequest cartUpdateRequest) async {
    final String token = CacheHelper.token;
    try {
      final response =
          await _apiService.updateCart(token, cartId, cartUpdateRequest);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<CartUpdateResponse>> deleteCart(int cartId) async {
    final String token = CacheHelper.token;
    try {
      final response = await _apiService.deleteCart(token, cartId);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
