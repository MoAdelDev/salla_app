import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response.dart';

class AddressesRepo {
  final ApiService _apiService;

  AddressesRepo(this._apiService);

  Future<ApiResult<AddressesResponse>> getAddresses() async {
    final String token = CacheHelper.token;
    try {
      final response = await _apiService.getAddresses(token);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message ?? '');
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
