import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/favorites/data/models/favorite_remove_response.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';

class FavoritesRepo {
  final ApiService _apiService;

  FavoritesRepo(this._apiService);

  Future<ApiResult<FavoritesResponse>> getFavorites() async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.getFavorites(token);
      if (response.status) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message ?? '');
      }
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }

  Future<ApiResult<FavoriteRemoveResponse>> removeFavorite(
      {required int id}) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.removeFavorite(token, id);
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
