// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['id'] as int,
      json['token'] as String,
      json['points'] as int,
      json['credits'],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'id': instance.id,
      'token': instance.token,
      'points': instance.points,
      'credits': instance.credits,
    };
