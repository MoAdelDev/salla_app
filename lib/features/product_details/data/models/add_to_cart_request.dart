import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_request.g.dart';

@JsonSerializable()
class AddToCartRequest {
  @JsonKey(name: 'product_id')
  final int productId;

  AddToCartRequest(this.productId);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}
