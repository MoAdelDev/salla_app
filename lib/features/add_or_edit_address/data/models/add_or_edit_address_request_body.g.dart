// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_edit_address_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrEditAddressRequestBody _$AddOrEditAddressRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddOrEditAddressRequestBody(
      json['name'] as String,
      json['details'] as String,
      json['notes'] as String,
      json['city'] as String,
      json['region'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddOrEditAddressRequestBodyToJson(
        AddOrEditAddressRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'notes': instance.notes,
      'city': instance.city,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
