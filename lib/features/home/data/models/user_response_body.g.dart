// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseBody _$UserResponseBodyFromJson(Map<String, dynamic> json) =>
    UserResponseBody(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseBodyToJson(UserResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.userModel,
    };
