import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/networking/api_result.dart';
import 'package:salla_app/core/payment/paymob/paymob_service.dart';
import 'package:salla_app/core/payment/stripe/payment_intent_request_body.dart';
import 'package:salla_app/core/payment/stripe/stripe_service.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class PaymentRepo {
  final StripeService _stripeService;
  final PaymobService _paymobService;
  PaymentRepo(
    this._stripeService,
    this._paymobService,
  );

  Future<ApiResult<void>> makeStripePayment(
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

  Future<ApiResult<void>> makePaymobPayment(
    double totalPrice,
    List<CartProductModel> products,
    AddressModel address,
  ) async {
    try {
      await _paymobService.payWithPaymob(
        totalPrice,
        products,
        address,
      );
      return const ApiResult.success(null);
    } on DioException catch (e) {
      return ApiResult.failure(e.message ?? '');
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
