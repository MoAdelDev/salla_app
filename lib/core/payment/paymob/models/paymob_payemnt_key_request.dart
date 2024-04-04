import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymob_payemnt_key_request.g.dart';

@JsonSerializable()
class PaymobPaymentKeyRequest {
  @JsonKey(name: 'auth_token')
  final String authToken;
  @JsonKey(name: 'amount_cents')
  final String amountCents;
  final int expiration;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'billing_data')
  final PaymobBillingData billingData;
  final String currency;
  @JsonKey(name: 'integration_id')
  final int integrationId;
  @JsonKey(name: 'lock_order_when_paid')
  final String lockOrderWhenPaid;

  PaymobPaymentKeyRequest({
    required this.authToken,
    required this.amountCents,
    required this.expiration,
    required this.orderId,
    required this.billingData,
    required this.currency,
    required this.integrationId,
    required this.lockOrderWhenPaid,
  });

  factory PaymobPaymentKeyRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymobPaymentKeyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobPaymentKeyRequestToJson(this);
}

@JsonSerializable()
class PaymobBillingData {
  final String apartment;
  final String email;
  final String floor;
  @JsonKey(name: 'first_name')
  final String firstName;
  final String street;
  final String building;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'shipping_method')
  final String shippingMethod;
  @JsonKey(name: 'postal_code')
  final String postalCode;
  final String city;
  final String country;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String state;

  PaymobBillingData({
    required this.apartment,
    required this.email,
    required this.floor,
    required this.firstName,
    required this.street,
    required this.building,
    required this.phoneNumber,
    required this.shippingMethod,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.lastName,
    required this.state,
  });

  Map<String, dynamic> toJson() => _$PaymobBillingDataToJson(this);

  factory PaymobBillingData.fromJson(Map<String, dynamic> json) =>
      _$PaymobBillingDataFromJson(json);
}
