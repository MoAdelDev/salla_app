// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderRequestBody _$AddOrderRequestBodyFromJson(Map<String, dynamic> json) =>
    AddOrderRequestBody(
      addressId: (json['address_id'] as num).toInt(),
      paymentMethod: (json['payment_method'] as num).toInt(),
      usePoints: json['use_points'] as bool,
    );

Map<String, dynamic> _$AddOrderRequestBodyToJson(
        AddOrderRequestBody instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'payment_method': instance.paymentMethod,
      'use_points': instance.usePoints,
    };
