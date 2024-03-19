import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/stripe/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:salla_app/core/stripe/payment_intent_model/payment_intent_model.dart';
import 'package:salla_app/core/stripe/payment_intent_request_body.dart';
part 'stripe_api_service.g.dart';

@RestApi(baseUrl: 'https://api.stripe.com/v1/')
abstract class StripeApiService {
  factory StripeApiService(Dio dio) = _StripeApiService;

  @POST('payment_intents')
  Future<PaymentIntentModel> createPaymentIntent(
    @Body() PaymentIntentRequestBody paymentIntentRequestBody,
    @Header('Content-Type') String contentType,
    @Header('Authorization') String token,
  );

  @POST('customers')
  Future<String> createCustomerId(
    @Body() Map<String, dynamic>? data,
    @Header('Content-Type') String contentType,
    @Header('Authorization') String token,
  );

  @GET('ephemeral_keys')
  Future<EphemeralKeyModel> createEphemeralKey(
    @Header('Authorization') String token,
    @Header('Content-Type') String contentType,
    @Header('Stripe-Version') String stripeVersion,
  );
}
