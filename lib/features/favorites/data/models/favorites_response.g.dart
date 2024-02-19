// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesResponse _$FavoritesResponseFromJson(Map<String, dynamic> json) =>
    FavoritesResponse(
      json['status'] as bool,
      json['message'] as String?,
      json['data'] == null
          ? null
          : FavoritesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesResponseToJson(FavoritesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FavoritesData _$FavoritesDataFromJson(Map<String, dynamic> json) =>
    FavoritesData(
      (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$FavoritesDataToJson(FavoritesData instance) =>
    <String, dynamic>{
      'data': instance.favorites,
      'total': instance.total,
    };

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      json['id'] as int,
      FavoriteProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

FavoriteProductModel _$FavoriteProductModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteProductModel(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['image'] as String,
      json['price'],
      json['old_price'],
      json['discount'] as int,
    );

Map<String, dynamic> _$FavoriteProductModelToJson(
        FavoriteProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
    };
