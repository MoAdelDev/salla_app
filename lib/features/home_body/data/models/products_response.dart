import 'package:json_annotation/json_annotation.dart';
part 'products_response.g.dart';

@JsonSerializable()
class ProductsReponsne {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final ProductsData productsData;

  ProductsReponsne(this.status, this.message, this.productsData);

  factory ProductsReponsne.fromJson(Map<String, dynamic> json) =>
      _$ProductsReponsneFromJson(json);
}

@JsonSerializable()
class ProductsData {
  @JsonKey(name: 'data')
  final List<ProductModel>? products;
  final int total;

  ProductsData(this.products, this.total);

  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);
}

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final dynamic price;
  @JsonKey(name: 'old_price')
  final dynamic oldPrice;
  final int discount;
  @JsonKey(name: 'in_favorites')
  final bool inFavorites;
  @JsonKey(name: 'in_cart')
  final bool inCart;
  final List<String> images;

  ProductModel(
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.oldPrice,
    this.discount,
    this.inFavorites,
    this.inCart,
    this.images,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
