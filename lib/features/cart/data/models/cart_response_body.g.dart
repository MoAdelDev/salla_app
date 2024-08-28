// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseBody _$CartResponseBodyFromJson(Map<String, dynamic> json) =>
    CartResponseBody(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseBodyToJson(CartResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      (json['cart_items'] as List<dynamic>)
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'cart_items': instance.cartProducts,
      'total': instance.total,
    };

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      (json['id'] as num).toInt(),
      (json['quantity'] as num).toInt(),
      ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };
