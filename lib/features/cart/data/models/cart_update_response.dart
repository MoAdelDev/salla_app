import 'package:json_annotation/json_annotation.dart';

part 'cart_update_response.g.dart';

@JsonSerializable()
class CartUpdateResponse {
  final bool status;
  final String message;

  CartUpdateResponse(this.status, this.message);

  factory CartUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$CartUpdateResponseFromJson(json);
}
