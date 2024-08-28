// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseBody _$OrdersResponseBodyFromJson(Map<String, dynamic> json) =>
    OrdersResponseBody(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : OrdersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersResponseBodyToJson(OrdersResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

OrdersData _$OrdersDataFromJson(Map<String, dynamic> json) => OrdersData(
      (json['data'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersDataToJson(OrdersData instance) =>
    <String, dynamic>{
      'data': instance.orders,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      (json['id'] as num).toInt(),
      json['total'],
      json['date'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'date': instance.date,
      'status': instance.status,
    };
