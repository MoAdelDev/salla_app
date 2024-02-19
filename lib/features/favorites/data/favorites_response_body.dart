import 'package:json_annotation/json_annotation.dart';

import '../../home_body/data/models/products_response.dart';
part 'favorites_response_body.g.dart';

@JsonSerializable()
class FavoritesResponseBody {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final FavoritesData data;
  FavoritesResponseBody(
    this.status,
    this.message,
    this.data,
  );

  factory FavoritesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseBodyFromJson(json);
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
