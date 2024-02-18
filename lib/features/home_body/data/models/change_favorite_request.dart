import 'package:json_annotation/json_annotation.dart';

part 'change_favorite_request.g.dart';

@JsonSerializable()
class ChangeFavoriteRequest {
  @JsonKey(name: 'product_id')
  final int productId;
  ChangeFavoriteRequest(this.productId);

  factory ChangeFavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeFavoriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeFavoriteRequestToJson(this);
}
