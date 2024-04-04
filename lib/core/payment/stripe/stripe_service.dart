import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla_app/core/payment/stripe/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:salla_app/core/payment/stripe/ephemeral_key_model/ephemeral_key_request_body.dart';
import 'package:salla_app/core/payment/stripe/payment_intent_model/payment_intent_model.dart';
import 'package:salla_app/core/payment/stripe/payment_intent_request_body.dart';
import 'package:salla_app/core/payment/stripe/stripe_api_service.dart';

class StripeService {
  final StripeApiService stripeApiService;
  StripeService(this.stripeApiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentRequestBody paymentIntentRequestBody) async {
    final response = await stripeApiService.createPaymentIntent(
      paymentIntentRequestBody,
      Headers.formUrlEncodedContentType,
      'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
    );
    return response;
  }

  Future<String> createCustomerId() async {
    final response = await stripeApiService.createCustomerId(
      Headers.formUrlEncodedContentType,
      'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
    );
    return response.id;
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
      EphemeralKeyRequestBody(customerId),
      'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
      Headers.formUrlEncodedContentType,
      '2023-10-16',
    );
    return response;
  }
}
