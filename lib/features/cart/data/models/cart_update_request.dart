import 'package:json_annotation/json_annotation.dart';
part 'cart_update_request.g.dart';

@JsonSerializable()
class CartUpdateRequest {
  final int quantity;

  CartUpdateRequest(this.quantity);

  Map<String, dynamic> toJson() => _$CartUpdateRequestToJson(this);
}
