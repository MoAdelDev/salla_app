// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyRequest _$RegisterBodyRequestFromJson(Map<String, dynamic> json) =>
    RegisterBodyRequest(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['image'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegisterBodyRequestToJson(
        RegisterBodyRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'password': instance.password,
    };
