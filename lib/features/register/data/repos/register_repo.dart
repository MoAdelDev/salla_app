import 'package:dio/dio.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/core/stripe/stripe_api_service.dart';
import 'package:salla_app/core/stripe/stripe_service.dart';
import 'package:salla_app/features/register/data/models/register_body_request.dart';
import 'package:salla_app/features/register/data/models/register_body_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterBodyResponse>> register({
    required RegisterBodyRequest registerBodyRequest,
  }) async {
    try {
      final response = await _apiService.register(registerBodyRequest);
      if (response.status) {
        await CacheHelper.saveToken(response.data?.token ?? '');
        final String customerId =
            await StripeService(getIt<StripeApiService>()).createCustomerId();
        await CacheHelper.saveString(key: 'customer_id', value: customerId);
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
          response.message,
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
