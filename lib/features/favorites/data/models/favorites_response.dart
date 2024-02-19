import 'package:json_annotation/json_annotation.dart';
part 'favorites_response.g.dart';

@JsonSerializable()
class FavoritesResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final FavoritesData? data;
  FavoritesResponse(
    this.status,
    this.message,
    this.data,
  );

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseFromJson(json);
}

@JsonSerializable()
class FavoritesData {
  @JsonKey(name: 'data')
  final List<FavoriteModel>? favorites;
  final int total;
  FavoritesData(
    this.favorites,
    this.total,
  );

  factory FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataFromJson(json);
}

@JsonSerializable()
class FavoriteModel {
  final int id;
  final FavoriteProductModel product;

  FavoriteModel(this.id, this.product);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}

@JsonSerializable()
class FavoriteProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;

  FavoriteProductModel(this.id, this.name, this.description, this.image,
      this.price, this.oldPrice, this.discount);

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductModelFromJson(json);
}
