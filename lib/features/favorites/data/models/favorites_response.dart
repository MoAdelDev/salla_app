import 'package:json_annotation/json_annotation.dart';

import '../../../home_body/data/models/products_response.dart';

part 'favorites_response.g.dart';

@JsonSerializable()
class FavoritesResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final FavoritesData data;
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
  final ProductModel product;

  FavoriteModel(this.id, this.product);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
