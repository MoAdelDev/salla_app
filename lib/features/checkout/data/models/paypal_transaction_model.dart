import 'package:json_annotation/json_annotation.dart';

part 'paypal_transaction_model.g.dart';

@JsonSerializable()
class PayPalTransactionModel {
  final String description;
  @JsonKey(name: 'item_list')
  final PayPalItems items;
  final AmountModel amount;

  PayPalTransactionModel(this.description, this.items, this.amount);

  factory PayPalTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$PayPalTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayPalTransactionModelToJson(this);
}

@JsonSerializable()
class AmountModel {
  final String total;
  final String currency;
  final AmountDetailsModel details;

  AmountModel(this.total, this.currency, this.details);

  factory AmountModel.fromJson(Map<String, dynamic> json) =>
      _$AmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountModelToJson(this);
}

@JsonSerializable()
class AmountDetailsModel {
  @JsonKey(name: 'subtotal')
  final String subTotal;
  final String shipping;
  @JsonKey(name: 'shipping_discount')
  final String shippingDiscount;

  AmountDetailsModel(this.subTotal, this.shipping, this.shippingDiscount);

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AmountDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountDetailsModelToJson(this);
}

@JsonSerializable()
class PayPalItems {
  final List<PayPalOrderModel> items;
  @JsonKey(name: 'shipping_address')
  final PayPalShipphingAddress shippingAddress;
  PayPalItems(this.items, this.shippingAddress);

  factory PayPalItems.fromJson(Map<String, dynamic> json) =>
      _$PayPalItemsFromJson(json);

  Map<String, dynamic> toJson() => _$PayPalItemsToJson(this);
}

@JsonSerializable()
class PayPalOrderModel {
  final String name;
  final String quantity;
  final String price;
  final String currency;

  PayPalOrderModel(this.name, this.quantity, this.price, this.currency);

  factory PayPalOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PayPalOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayPalOrderModelToJson(this);
}

@JsonSerializable()
class PayPalShipphingAddress {
  @JsonKey(name: 'recipient_name')
  final String recipientName;
  final String line1;
  final String line2;
  final String city;
  @JsonKey(name: 'postal_code')
  final String postalCode;
  final String phone;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String state;

  PayPalShipphingAddress(this.recipientName, this.line1, this.line2, this.city,
      this.postalCode, this.phone, this.countryCode, this.state);

  factory PayPalShipphingAddress.fromJson(Map<String, dynamic> json) =>
      _$PayPalShipphingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$PayPalShipphingAddressToJson(this);
}
