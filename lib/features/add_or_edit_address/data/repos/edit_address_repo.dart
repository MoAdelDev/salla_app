import 'package:dio/dio.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/features/add_or_edit_address/data/models/add_or_edit_address_request_body.dart';
import 'package:salla_app/features/add_or_edit_address/data/models/add_or_edit_address_response_body.dart';

class EditAddressRepo {
  final ApiService _apiService;

  EditAddressRepo(this._apiService);

  Future<ApiResult<AddOrEditAddressResponseBody>> updateAddress(
    int addressId,
    AddOrEditAddressRequestBody addOrEditAddressRequestBody,
  ) async {
    final String token = await CacheHelper.token;
    try {
      final response = await _apiService.updateAddress(
        token,
        addOrEditAddressRequestBody,
        addressId,
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
