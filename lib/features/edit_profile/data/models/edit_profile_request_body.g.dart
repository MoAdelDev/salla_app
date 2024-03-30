// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestBody(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$EditProfileRequestBodyToJson(
        EditProfileRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
