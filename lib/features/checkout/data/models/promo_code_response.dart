import 'package:json_annotation/json_annotation.dart';
part 'promo_code_response.g.dart';

@JsonSerializable()
class PromoCodeResponse {
  final String message;
  final bool status;

  PromoCodeResponse(this.message, this.status);

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PromoCodeResponseToJson(this);
}
