// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymob_payemnt_key_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymobPaymentKeyRequest _$PaymobPaymentKeyRequestFromJson(
        Map<String, dynamic> json) =>
    PaymobPaymentKeyRequest(
      authToken: json['auth_token'] as String,
      amountCents: json['amount_cents'] as String,
      expiration: json['expiration'] as int,
      orderId: json['order_id'] as String,
      billingData: PaymobBillingData.fromJson(
          json['billing_data'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      integrationId: json['integration_id'] as int,
      lockOrderWhenPaid: json['lock_order_when_paid'] as String,
    );

Map<String, dynamic> _$PaymobPaymentKeyRequestToJson(
        PaymobPaymentKeyRequest instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'amount_cents': instance.amountCents,
      'expiration': instance.expiration,
      'order_id': instance.orderId,
      'billing_data': instance.billingData,
      'currency': instance.currency,
      'integration_id': instance.integrationId,
      'lock_order_when_paid': instance.lockOrderWhenPaid,
    };

PaymobBillingData _$PaymobBillingDataFromJson(Map<String, dynamic> json) =>
    PaymobBillingData(
      apartment: json['apartment'] as String,
      email: json['email'] as String,
      floor: json['floor'] as String,
      firstName: json['first_name'] as String,
      street: json['street'] as String,
      building: json['building'] as String,
      phoneNumber: json['phone_number'] as String,
      shippingMethod: json['shipping_method'] as String,
      postalCode: json['postal_code'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      lastName: json['last_name'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$PaymobBillingDataToJson(PaymobBillingData instance) =>
    <String, dynamic>{
      'apartment': instance.apartment,
      'email': instance.email,
      'floor': instance.floor,
      'first_name': instance.firstName,
      'street': instance.street,
      'building': instance.building,
      'phone_number': instance.phoneNumber,
      'shipping_method': instance.shippingMethod,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'country': instance.country,
      'last_name': instance.lastName,
      'state': instance.state,
    };
