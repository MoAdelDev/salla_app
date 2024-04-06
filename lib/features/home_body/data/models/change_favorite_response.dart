import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_favorite_response.g.dart';

@JsonSerializable()
class ChangeFavoriteResponse {
  final bool status;
  final String? message;
  final ChangeFavoriteData? data;

  ChangeFavoriteResponse(this.status, this.message, this.data);

  factory ChangeFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeFavoriteResponseFromJson(json);
}

@JsonSerializable()
class ChangeFavoriteData {
  final int id;

  ChangeFavoriteData(this.id);

  factory ChangeFavoriteData.fromJson(Map<String, dynamic> json) =>
      _$ChangeFavoriteDataFromJson(json);
}
