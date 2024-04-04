import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymob_order_registration_request.g.dart';

@JsonSerializable()
class PaymobOrderRegistrationRequest {
  @JsonKey(name: 'auth_token')
  final String authToken;
  @JsonKey(name: 'delivery_needed')
  final String deliveryNeeded;
  @JsonKey(name: 'amount_cents')
  final String amountCents;
  final String currency;
  @JsonKey(name: 'merchant_order_id')
  final String merchantOrderId;
  final List<PaymobItem> items;
  @JsonKey(name: 'shipping_data')
  final PaymobShippingData shippingData;

  PaymobOrderRegistrationRequest({
    required this.authToken,
    required this.deliveryNeeded,
    required this.amountCents,
    required this.currency,
    required this.merchantOrderId,
    required this.items,
    required this.shippingData,
  });

  factory PaymobOrderRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymobOrderRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobOrderRegistrationRequestToJson(this);
}
// "shipping_data": {
//     "apartment": "803",
//     "email": "claudette09@exa.com",
//     "floor": "42",
//     "first_name": "Clifford",
//     "street": "Ethan Land",
//     "building": "8028",
//     "phone_number": "+86(8)9135210487",
//     "postal_code": "01898",
//      "extra_description": "8 Ram , 128 Giga",
//     "city": "Jaskolskiburgh",
//     "country": "CR",
//     "last_name": "Nicolas",
//     "state": "Utah"
//   },

@JsonSerializable()
class PaymobShippingData {
  final String apartment;
  final String email;
  final String floor;
  @JsonKey(name: 'first_name')
  final String firstName;
  final String street;
  final String building;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @JsonKey(name: 'extra_description')
  final String extraDescription;
  final String city;
  final String country;
  final String lastName;
  final String state;

  PaymobShippingData({
    required this.apartment,
    required this.email,
    required this.floor,
    required this.firstName,
    required this.street,
    required this.building,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    required this.city,
    required this.country,
    required this.lastName,
    required this.state,
  });

  Map<String, dynamic> toJson() => _$PaymobShippingDataToJson(this);

  factory PaymobShippingData.fromJson(Map<String, dynamic> json) =>
      _$PaymobShippingDataFromJson(json);
}

@JsonSerializable()
class PaymobItem {
  final String name;
  final String amountCents;
  final String description;
  final String quantity;

  PaymobItem({
    required this.name,
    required this.amountCents,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$PaymobItemToJson(this);

  factory PaymobItem.fromJson(Map<String, dynamic> json) =>
      _$PaymobItemFromJson(json);
}
