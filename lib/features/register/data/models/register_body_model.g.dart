// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyModel _$RegisterBodyModelFromJson(Map<String, dynamic> json) =>
    RegisterBodyModel(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['image'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegisterBodyModelToJson(RegisterBodyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'password': instance.password,
    };
