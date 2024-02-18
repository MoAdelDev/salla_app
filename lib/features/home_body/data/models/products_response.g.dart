// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsReponsne _$ProductsReponsneFromJson(Map<String, dynamic> json) =>
    ProductsReponsne(
      json['status'] as bool,
      json['message'] as String?,
      ProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsReponsneToJson(ProductsReponsne instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.productsData,
    };

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'data': instance.products,
      'total': instance.total,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as int,
      json['name'] as String,
      json['image'] as String,
      json['description'] as String,
      json['price'],
      json['old_price'],
      json['discount'] as int,
      json['in_favorites'] as bool,
      json['in_cart'] as bool,
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
      'images': instance.images,
    };
