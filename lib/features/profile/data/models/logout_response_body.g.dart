// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseBody _$LogoutResponseBodyFromJson(Map<String, dynamic> json) =>
    LogoutResponseBody(
      json['message'] as String,
      json['status'] as bool,
    );

Map<String, dynamic> _$LogoutResponseBodyToJson(LogoutResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
