// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponse _$AddToCartResponseFromJson(Map<String, dynamic> json) =>
    AddToCartResponse(
      json['status'] as bool,
      json['message'] as String?,
    );

Map<String, dynamic> _$AddToCartResponseToJson(AddToCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
