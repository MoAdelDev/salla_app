// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentRequestBody _$PaymentIntentRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PaymentIntentRequestBody(
      json['amount'] as String,
      json['currency'] as String,
      json['customerId'] as String,
    );

Map<String, dynamic> _$PaymentIntentRequestBodyToJson(
        PaymentIntentRequestBody instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'customerId': instance.customerId,
    };
