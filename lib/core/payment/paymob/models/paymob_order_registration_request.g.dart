// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymob_order_registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymobOrderRegistrationRequest _$PaymobOrderRegistrationRequestFromJson(
        Map<String, dynamic> json) =>
    PaymobOrderRegistrationRequest(
      authToken: json['auth_token'] as String,
      deliveryNeeded: json['delivery_needed'] as String,
      amountCents: json['amount_cents'] as String,
      currency: json['currency'] as String,
      merchantOrderId: json['merchant_order_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PaymobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingData: PaymobShippingData.fromJson(
          json['shipping_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymobOrderRegistrationRequestToJson(
        PaymobOrderRegistrationRequest instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'delivery_needed': instance.deliveryNeeded,
      'amount_cents': instance.amountCents,
      'currency': instance.currency,
      'merchant_order_id': instance.merchantOrderId,
      'items': instance.items,
      'shipping_data': instance.shippingData,
    };

PaymobShippingData _$PaymobShippingDataFromJson(Map<String, dynamic> json) =>
    PaymobShippingData(
      apartment: json['apartment'] as String,
      email: json['email'] as String,
      floor: json['floor'] as String,
      firstName: json['first_name'] as String,
      street: json['street'] as String,
      building: json['building'] as String,
      phoneNumber: json['phone_number'] as String,
      postalCode: json['postal_code'] as String,
      extraDescription: json['extra_description'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      lastName: json['lastName'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$PaymobShippingDataToJson(PaymobShippingData instance) =>
    <String, dynamic>{
      'apartment': instance.apartment,
      'email': instance.email,
      'floor': instance.floor,
      'first_name': instance.firstName,
      'street': instance.street,
      'building': instance.building,
      'phone_number': instance.phoneNumber,
      'postal_code': instance.postalCode,
      'extra_description': instance.extraDescription,
      'city': instance.city,
      'country': instance.country,
      'lastName': instance.lastName,
      'state': instance.state,
    };

PaymobItem _$PaymobItemFromJson(Map<String, dynamic> json) => PaymobItem(
      name: json['name'] as String,
      amountCents: json['amountCents'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$PaymobItemToJson(PaymobItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amountCents': instance.amountCents,
      'description': instance.description,
      'quantity': instance.quantity,
    };
