// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseBody _$EditProfileResponseBodyFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseBody(
      json['message'] as String,
      json['status'] as bool,
      json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseBodyToJson(
        EditProfileResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
