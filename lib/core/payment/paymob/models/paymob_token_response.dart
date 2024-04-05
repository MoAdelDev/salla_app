import 'package:json_annotation/json_annotation.dart';

part 'paymob_token_response.g.dart';

@JsonSerializable()
class PaymobTokenResponse {
  final String token;

  PaymobTokenResponse(this.token);

  factory PaymobTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobTokenResponseToJson(this);
}
