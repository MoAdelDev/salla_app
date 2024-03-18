// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      json['status'] as bool,
      json['message'] as String,
      json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
