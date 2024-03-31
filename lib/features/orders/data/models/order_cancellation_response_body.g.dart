// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancellation_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCacnellationResponseBody _$OrderCacnellationResponseBodyFromJson(
        Map<String, dynamic> json) =>
    OrderCacnellationResponseBody(
      json['status'] as bool,
      json['message'] as String?,
    );

Map<String, dynamic> _$OrderCacnellationResponseBodyToJson(
        OrderCacnellationResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
