// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFavoriteRequest _$ChangeFavoriteRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeFavoriteRequest(
      (json['product_id'] as num).toInt(),
    );

Map<String, dynamic> _$ChangeFavoriteRequestToJson(
        ChangeFavoriteRequest instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
    };
