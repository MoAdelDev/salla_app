import 'package:json_annotation/json_annotation.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
part 'cart_response_body.g.dart';

@JsonSerializable()
class CartResponseBody {
  final bool status;
  final String? message;
  final CartData? data;

  CartResponseBody(this.status, this.message, this.data);

  factory CartResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CartResponseBodyFromJson(json);
}

@JsonSerializable()
class CartData {
  @JsonKey(name: 'cart_items')
  final List<CartProductModel> cartProducts;
  final int total;

  CartData(this.cartProducts, this.total);

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}

@JsonSerializable()
class CartProductModel {
  final int id;
  final int quantity;
  final ProductModel product;

  CartProductModel(this.id, this.quantity, this.product);

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}
