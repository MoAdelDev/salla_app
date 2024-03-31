// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_edit_address_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrEditAddressResponseBody _$AddOrEditAddressResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddOrEditAddressResponseBody(
      json['message'] as String,
      json['status'] as bool,
      json['data'] == null
          ? null
          : AddressModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrEditAddressResponseBodyToJson(
        AddOrEditAddressResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
