import 'package:json_annotation/json_annotation.dart';

part 'paymob_payment_key_response.g.dart';

@JsonSerializable()
class PaymobPaymentKeyResponse {
  final String token;

  PaymobPaymentKeyResponse(this.token);

  factory PaymobPaymentKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobPaymentKeyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobPaymentKeyResponseToJson(this);
}
