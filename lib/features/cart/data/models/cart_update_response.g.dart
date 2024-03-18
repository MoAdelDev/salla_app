// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartUpdateResponse _$CartUpdateResponseFromJson(Map<String, dynamic> json) =>
    CartUpdateResponse(
      json['status'] as bool,
      json['message'] as String,
    );

Map<String, dynamic> _$CartUpdateResponseToJson(CartUpdateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
