import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/addresses/data/models/delete_address_response_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddressesRepo {
  final ApiService _apiService;

  AddressesRepo(this._apiService);

  Future<ApiResult<AddressesResponseBody>> getAddresses() async {
    final String token = await CacheHelper.token;
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

  Future<ApiResult<DeleteAddressResponseBody>> deleteAddress(
      int addressId) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.deleteAddress(token, addressId);
      if (response.status) {
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message ?? '');
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
