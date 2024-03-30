import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
import 'package:salla_app/core/stripe/stripe_service.dart';

class PaymentRepo {
  final StripeService _stripeService;
  PaymentRepo(this._stripeService);

  Future<ApiResult<void>> makePayment(
      PaymentIntentRequestBody paymentIntentRequestBody) async {
    final String customerId = await CacheHelper.getString(key: 'customer_id');
    try {
      await _stripeService.makePayment(
        paymentIntentRequestBody: paymentIntentRequestBody,
        customerId: customerId,
      );
      return const ApiResult.success(null);
    } on StripeConfigException catch (e) {
      return ApiResult.failure(e.message);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
