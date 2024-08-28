// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      (json['id'] as num).toInt(),
      json['token'] as String,
      (json['points'] as num?)?.toInt(),
      json['credits'],
    )..avatar = json['avatar'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'id': instance.id,
      'token': instance.token,
      'points': instance.points,
      'credits': instance.credits,
      'avatar': instance.avatar,
    };
