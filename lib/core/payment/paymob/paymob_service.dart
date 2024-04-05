import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_order_registration_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_payemnt_key_request.dart';
import 'package:salla_app/core/payment/paymob/models/paymob_token_request.dart';
import 'package:salla_app/core/payment/paymob/paymob_api_service.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../features/cart/data/models/cart_response_body.dart';

class PaymobService {
  final PaymobApiService paymobApiService;

  PaymobService(this.paymobApiService);

  Future<void> payWithPaymob(
    double totalPrice,
    List<CartProductModel> products,
    AddressModel address,
  ) async {
    final String paymentKey = await getPaymentKey(
      totalPrice,
      products,
      address,
    );
    canLaunchUrl(
      Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/833389?payment_token=$paymentKey',
      ),
    ).then((value) {
      if (value) {
        launchUrl(
          Uri.parse(
            'https://accept.paymob.com/api/acceptance/iframes/833389?payment_token=$paymentKey',
          ),
        );
        log('payment key: $paymentKey');
      } else {
        log('payment key: error');
        throw 'error';
      }
    });
  }

  Future<String> _getAuthenticatorToken() async {
    PaymobTokenRequest request = PaymobTokenRequest(
      apiKey: dotenv.env['PAYMOB_API_KEY'] ?? '',
    );
    final response = await paymobApiService.getAuthenticatorToken(request);
    log('token: ${response.token}');
    return response.token;
  }

  Future<int> _getOrderId(
    String token,
    double totalPrice,
    List<CartProductModel> products,
    AddressModel address,
  ) async {
    List<Map<String, dynamic>> items = products
        .map(
          (e) => PaymobItem(
            name: e.product.name,
            amountCents: '${e.product.price * 100}',
            description: '',
            quantity: e.quantity.toString(),
          ).toJson(),
        )
        .toList();

    Map<String, dynamic> shippingData = PaymobShippingData(
      apartment: '1',
      email: AppData.userModel.email,
      floor: address.details,
      firstName: AppData.userModel.name,
      street: 'Abrag Al Nasr',
      building: address.details,
      phoneNumber: AppData.userModel.phone,
      postalCode: '11582',
      extraDescription: address.name,
      city: address.city,
      country: 'EG',
      lastName: AppData.userModel.name,
      state: address.region,
    ).toJson();
    PaymobOrderRegistrationRequest paymobOrderRegistrationRequest =
        PaymobOrderRegistrationRequest(
      authToken: token,
      deliveryNeeded: "false",
      amountCents: '${totalPrice * 100}',
      currency: 'EGP',
      items: items,
      shippingData: shippingData,
    );
    final response = await paymobApiService.getOrderId(
      paymobOrderRegistrationRequest,
    );
    return response.id;
  }

  Future<String> getPaymentKey(
    double totalPrice,
    List<CartProductModel> products,
    AddressModel address,
  ) async {
    final token = await _getAuthenticatorToken();

    final int orderId = await _getOrderId(
      token,
      totalPrice,
      products,
      address,
    );

    final String paymentKey = await _getPaymentKey(
      token,
      orderId,
      'EGP',
      totalPrice,
      address,
    );
    return paymentKey;
  }

  Future<String> _getPaymentKey(
    String token,
    int orderId,
    String currency,
    double totalPrice,
    AddressModel address,
  ) async {
    PaymobBillingData billingData = PaymobBillingData(
      apartment: 'NA',
      email: AppData.userModel.email,
      floor: address.details,
      firstName: AppData.userModel.name,
      street: 'NA',
      building: address.details,
      phoneNumber: AppData.userModel.phone,
      postalCode: 'NA',
      city: address.city,
      country: 'EG',
      lastName: AppData.userModel.name,
      state: address.region,
      shippingMethod: 'NA',
    );
    PaymobPaymentKeyRequest request = PaymobPaymentKeyRequest(
      authToken: token,
      amountCents: '${totalPrice * 100}',
      expiration: 3600,
      orderId: orderId.toString(),
      billingData: billingData.toJson(),
      currency: currency,
      integrationId: int.parse(dotenv.env['PAYMOB_INTEGRATION_ID'] ?? '0'),
      lockOrderWhenPaid: 'false',
    );
    final response = await paymobApiService.getPaymentKey(request);
    return response.token;
  }
}
