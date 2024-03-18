// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyResponse _$RegisterBodyResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterBodyResponse(
      json['status'] as bool,
      json['message'] as String,
      json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterBodyResponseToJson(
        RegisterBodyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
