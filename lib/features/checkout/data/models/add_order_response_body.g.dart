// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderResponseBody _$AddOrderResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddOrderResponseBody(
      json['status'] as bool,
      json['message'] as String,
    );

Map<String, dynamic> _$AddOrderResponseBodyToJson(
        AddOrderResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
