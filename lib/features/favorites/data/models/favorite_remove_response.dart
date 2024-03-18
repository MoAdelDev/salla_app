import 'package:json_annotation/json_annotation.dart';
part 'favorite_remove_response.g.dart';

@JsonSerializable()
class FavoriteRemoveResponse {
  final bool status;
  final String? message;

  FavoriteRemoveResponse(this.status, this.message);

  factory FavoriteRemoveResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRemoveResponseFromJson(json);
}
