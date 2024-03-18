import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final ProductModel product;

  const ProductDetailsResponse({
    required this.status,
    required this.message,
    required this.product,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}
