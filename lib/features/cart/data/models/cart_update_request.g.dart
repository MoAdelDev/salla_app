// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartUpdateRequest _$CartUpdateRequestFromJson(Map<String, dynamic> json) =>
    CartUpdateRequest(
      (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartUpdateRequestToJson(CartUpdateRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
    };
