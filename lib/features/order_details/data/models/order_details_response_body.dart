import 'package:json_annotation/json_annotation.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

part 'order_details_response_body.g.dart';

@JsonSerializable()
class OrderDetailsResponseBody {
  final bool status;
  final String? message;
  final OrderDetailsData? data;

  OrderDetailsResponseBody(this.status, this.message, this.data);

  factory OrderDetailsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseBodyFromJson(json);
}

@JsonSerializable()
class OrderDetailsData {
  final int id;
  final dynamic cost;
  @JsonKey(name: 'vat')
  final dynamic tax;
  final dynamic total;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  final String date;
  String status;
  final AddressModel address;
  final List<OrderDetailsProductModel> products;

  OrderDetailsData(
    this.id,
    this.cost,
    this.tax,
    this.total,
    this.paymentMethod,
    this.date,
    this.status,
    this.address,
    this.products,
  );

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDataFromJson(json);
}

@JsonSerializable()
class OrderDetailsProductModel {
  final int id;
  final int quantity;
  final String name;
  final dynamic price;
  final String image;

  OrderDetailsProductModel(
    this.id,
    this.quantity,
    this.name,
    this.price,
    this.image,
  );

  factory OrderDetailsProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsProductModelFromJson(json);
}
