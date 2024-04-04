import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymob_token_request.g.dart';

@JsonSerializable()
class PaymobTokenRequest {
  @JsonKey(name: 'api_key')
  final String apiKey;

  PaymobTokenRequest({required this.apiKey});

  factory PaymobTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymobTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobTokenRequestToJson(this);
}
