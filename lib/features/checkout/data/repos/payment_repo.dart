import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
import 'package:salla_app/core/stripe/stripe_service.dart';

class PaymentRepo {
  final StripeService _stripeService;
  PaymentRepo(this._stripeService);

  Future<ApiResult<void>> makePayment(
      PaymentIntentRequestBody paymentIntentRequestBody) async {
    try {
      await _stripeService.makePayment(
        paymentIntentRequestBody: paymentIntentRequestBody,
        customerId: CacheHelper.getString(key: 'customer_id'),
      );
      return const ApiResult.success(null);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
