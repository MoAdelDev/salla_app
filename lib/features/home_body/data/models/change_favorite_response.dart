import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_favorite_response.g.dart';

@JsonSerializable()
class ChangeFavoriteResponse {
  final bool status;
  final String? message;

  ChangeFavoriteResponse(this.status, this.message);

  factory ChangeFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeFavoriteResponseFromJson(json);
}
