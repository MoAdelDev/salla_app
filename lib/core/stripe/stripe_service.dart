import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla_app/core/networking/stripe_keys.dart';
import 'package:salla_app/core/stripe/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:salla_app/core/stripe/payment_intent_model/payment_intent_model.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
import 'package:salla_app/core/stripe/stripe_api_service.dart';

class StripeService {
  final StripeApiService stripeApiService;
  StripeService(this.stripeApiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentRequestBody paymentIntentRequestBody) async {
    final response = await stripeApiService.createPaymentIntent(
      paymentIntentRequestBody,
      Headers.formUrlEncodedContentType,
      'Bearer ${StripeKeys.secretKey}',
    );
    return response;
  }

  Future<String> createCustomerId() async {
    final response = await stripeApiService.createCustomerId(
      null,
      Headers.formUrlEncodedContentType,
      'Bearer ${StripeKeys.secretKey}',
    );
    return response;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String ephemeralKeySecret,
    required String customerId,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerEphemeralKeySecret: ephemeralKeySecret,
        customerId: customerId,
        merchantDisplayName: 'Mohammed Adel',
      ),
    );
  }

  Future<void> displayPayemntSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentRequestBody paymentIntentRequestBody,
    required String customerId,
  }) async {
    var paymentIntetntModel = await createPaymentIntent(
      paymentIntentRequestBody,
    );
    var ephemeralKey = await createEphemeralKey(customerId: customerId);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntetntModel.clientSecret ?? '',
      ephemeralKeySecret: ephemeralKey.secret ?? '',
      customerId: customerId,
    );
    await displayPayemntSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    final response = await stripeApiService.createEphemeralKey(
      'Bearer ${StripeKeys.secretKey}',
      Headers.formUrlEncodedContentType,
      '2023-10-16',
    );
    return response;
  }
}
