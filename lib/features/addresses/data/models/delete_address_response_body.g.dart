// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_address_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAddressResponseBody _$DeleteAddressResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DeleteAddressResponseBody(
      json['message'] as String?,
      json['status'] as bool,
    );

Map<String, dynamic> _$DeleteAddressResponseBodyToJson(
        DeleteAddressResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
