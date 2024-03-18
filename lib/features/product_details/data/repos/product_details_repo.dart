import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_request.dart';
import 'package:salla_app/features/product_details/data/models/add_to_cart_response.dart';
import 'package:salla_app/features/product_details/data/models/product_details_response.dart';

class ProductDetailsRepo {
  final ApiService _apiService;
  ProductDetailsRepo(this._apiService);

  Future<ApiResult<ProductDetailsResponse>> getProductDetails(
      int productId) async {
    try {
      final String token = CacheHelper.token;
      final result = await _apiService.getProductDetails(token, productId);
      if (result.status) {
        return ApiResult.success(result);
      } else {
        return ApiResult.failure(result.message ?? '');
      }
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<AddToCartResponse>> addToCart(
      AddToCartRequest addToCartRequest) async {
    try {
      final String token = CacheHelper.token;
      final result = await _apiService.addToCart(token, addToCartRequest);
      if (result.status) {
        return ApiResult.success(result);
      } else {
        return ApiResult.failure(result.message ?? '');
      }
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
