import 'package:dio/dio.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/core/stripe/stripe_api_service.dart';
import 'package:salla_app/core/stripe/stripe_service.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(
    this.apiService,
  );

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      if (response.status) {
        await CacheHelper.saveToken(response.data?.token ?? '');
        final String customerId =
            await StripeService(getIt<StripeApiService>()).createCustomerId();
        await CacheHelper.saveString(key: 'customer_id', value: customerId);
        return ApiResult.success(response);
      }
      return ApiResult.failure(response.message);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    }
  }
}
