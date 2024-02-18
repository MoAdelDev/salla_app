import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_error_model.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_response.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class HomeBodyRepo {
  final ApiService _apiService;
  const HomeBodyRepo(this._apiService);

  Future<ApiResult<BannersResponse>> getBanners() async {
    try {
      final response = await _apiService.getBanners();
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(status: response.status, message: response.message ?? ''),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(status: false, message: e.message ?? ''),
      );
    }
  }

  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(status: response.status, message: response.message ?? ''),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(status: false, message: e.message ?? ''),
      );
    }
  }

  Future<ApiResult<ProductsReponsne>> getProducts() async {
    final String token = CacheHelper.token;
    try {
      final response = await _apiService.getProducts(token);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(status: response.status, message: response.message ?? ''),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(status: false, message: e.message ?? ''),
      );
    }
  }

  Future<ApiResult<ChangeFavoriteResponse>> changeFavorite({
    required ChangeFavoriteRequest changeFavoriteRequest,
  }) async {
    final String token = CacheHelper.token;
    try {
      final response =
          await _apiService.changeFavorite(token, changeFavoriteRequest);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(status: response.status, message: response.message ?? ''),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(status: false, message: e.message ?? ''),
      );
    }
  }

  Future<ApiResult<ProductsReponsne>> getProductsByCategory({
    required int categoryId,
  }) async {
    final String token = CacheHelper.token;
    try {
      final response =
          await _apiService.getProductsByCategory(token, categoryId);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(
        ApiErrorModel(status: response.status, message: response.message ?? ''),
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        ApiErrorModel(status: false, message: e.message ?? ''),
      );
    }
  }
}
