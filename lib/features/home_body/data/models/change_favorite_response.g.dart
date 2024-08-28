// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFavoriteResponse _$ChangeFavoriteResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoriteResponse(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : ChangeFavoriteData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangeFavoriteResponseToJson(
        ChangeFavoriteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ChangeFavoriteData _$ChangeFavoriteDataFromJson(Map<String, dynamic> json) =>
    ChangeFavoriteData(
      (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ChangeFavoriteDataToJson(ChangeFavoriteData instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
