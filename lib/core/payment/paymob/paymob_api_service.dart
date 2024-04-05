import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_order_registration_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_order_response.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_payemnt_key_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_payment_key_response.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_token_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_token_response.dart';

part 'paymob_api_service.g.dart';

@RestApi(baseUrl: 'https://accept.paymob.com/api/')
abstract class PaymobApiService {
  factory PaymobApiService(Dio dio, {String baseUrl}) = _PaymobApiService;

  @POST('auth/tokens')
  Future<PaymobTokenResponse> getAuthenticatorToken(
    @Body() PaymobTokenRequest paymobTokenRequest,
  );

  @POST('ecommerce/orders')
  Future<PaymobOrderResponse> getOrderId(
    @Body() PaymobOrderRegistrationRequest paymobOrderRegistrationRequest,
  );

  @POST('acceptance/payment_keys')
  Future<PaymobPaymentKeyResponse> getPaymentKey(
    @Body() PaymobPaymentKeyRequest paymobOrderRegistrationRequest,
  );
}
