// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponseBody _$OrderDetailsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsResponseBody(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : OrderDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsResponseBodyToJson(
        OrderDetailsResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

OrderDetailsData _$OrderDetailsDataFromJson(Map<String, dynamic> json) =>
    OrderDetailsData(
      (json['id'] as num).toInt(),
      json['cost'],
      json['vat'],
      json['total'],
      json['payment_method'] as String,
      json['date'] as String,
      json['status'] as String,
      AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      (json['products'] as List<dynamic>)
          .map((e) =>
              OrderDetailsProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsDataToJson(OrderDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'vat': instance.tax,
      'total': instance.total,
      'payment_method': instance.paymentMethod,
      'date': instance.date,
      'status': instance.status,
      'address': instance.address,
      'products': instance.products,
    };

OrderDetailsProductModel _$OrderDetailsProductModelFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsProductModel(
      (json['id'] as num).toInt(),
      (json['quantity'] as num).toInt(),
      json['name'] as String,
      json['price'],
      json['image'] as String,
    );

Map<String, dynamic> _$OrderDetailsProductModelToJson(
        OrderDetailsProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
