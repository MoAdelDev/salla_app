import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_order_registration_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_payemnt_key_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_token_request.dart';

part 'paymob_api_service.g.dart';

@RestApi(baseUrl: 'https://accept.paymob.com/api/')
abstract class PaymobApiService {
  factory PaymobApiService(Dio dio, {String baseUrl}) = _PaymobApiService;

  @POST('auth/tokens')
  Future<String> getAuthenticatorToken(
    @Body() PaymobTokenRequest paymobTokenRequest,
  );

  @POST('ecommerce/orders')
  Future<int> getOrderId(
    @Body() PaymobOrderRegistrationRequest paymobOrderRegistrationRequest,
  );

  @POST('acceptance/payment_keys')
  Future<String> getPaymentKey(
    @Body() PaymobPaymentKeyRequest paymobOrderRegistrationRequest,
  );
}
