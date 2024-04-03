// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paypal_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayPalTransactionModel _$PayPalTransactionModelFromJson(
        Map<String, dynamic> json) =>
    PayPalTransactionModel(
      json['description'] as String,
      PayPalItems.fromJson(json['item_list'] as Map<String, dynamic>),
      AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayPalTransactionModelToJson(
        PayPalTransactionModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'item_list': instance.items,
      'amount': instance.amount,
    };

AmountModel _$AmountModelFromJson(Map<String, dynamic> json) => AmountModel(
      json['total'] as String,
      json['currency'] as String,
      AmountDetailsModel.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountModelToJson(AmountModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currency': instance.currency,
      'details': instance.details,
    };

AmountDetailsModel _$AmountDetailsModelFromJson(Map<String, dynamic> json) =>
    AmountDetailsModel(
      json['subtotal'] as String,
      json['shipping'] as String,
      json['shipping_discount'] as String,
    );

Map<String, dynamic> _$AmountDetailsModelToJson(AmountDetailsModel instance) =>
    <String, dynamic>{
      'subtotal': instance.subTotal,
      'shipping': instance.shipping,
      'shipping_discount': instance.shippingDiscount,
    };

PayPalItems _$PayPalItemsFromJson(Map<String, dynamic> json) => PayPalItems(
      (json['items'] as List<dynamic>)
          .map((e) => PayPalOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      PayPalShipphingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayPalItemsToJson(PayPalItems instance) =>
    <String, dynamic>{
      'items': instance.items,
      'shipping_address': instance.shippingAddress,
    };

PayPalOrderModel _$PayPalOrderModelFromJson(Map<String, dynamic> json) =>
    PayPalOrderModel(
      json['name'] as String,
      json['quantity'] as String,
      json['price'] as String,
      json['currency'] as String,
    );

Map<String, dynamic> _$PayPalOrderModelToJson(PayPalOrderModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
      'currency': instance.currency,
    };

PayPalShipphingAddress _$PayPalShipphingAddressFromJson(
        Map<String, dynamic> json) =>
    PayPalShipphingAddress(
      json['recipient_name'] as String,
      json['line1'] as String,
      json['line2'] as String,
      json['city'] as String,
      json['postal_code'] as String,
      json['phone'] as String,
      json['country_code'] as String,
      json['state'] as String,
    );

Map<String, dynamic> _$PayPalShipphingAddressToJson(
        PayPalShipphingAddress instance) =>
    <String, dynamic>{
      'recipient_name': instance.recipientName,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'country_code': instance.countryCode,
      'state': instance.state,
    };
