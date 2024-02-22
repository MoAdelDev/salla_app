import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  final bool status;
  final String? message;

  AddToCartResponse(this.status, this.message);

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);
}
