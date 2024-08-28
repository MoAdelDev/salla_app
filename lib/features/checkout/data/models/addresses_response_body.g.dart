// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesResponseBody _$AddressesResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddressesResponseBody(
      json['message'] as String?,
      json['status'] as bool,
      json['data'] == null
          ? null
          : AddressesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressesResponseBodyToJson(
        AddressesResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

AddressesData _$AddressesDataFromJson(Map<String, dynamic> json) =>
    AddressesData(
      (json['data'] as List<dynamic>)
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressesDataToJson(AddressesData instance) =>
    <String, dynamic>{
      'data': instance.addresses,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['city'] as String,
      json['region'] as String,
      json['details'] as String,
      json['notes'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'region': instance.region,
      'details': instance.details,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
