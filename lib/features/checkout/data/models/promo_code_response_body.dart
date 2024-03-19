import 'package:json_annotation/json_annotation.dart';
part 'promo_code_response_body.g.dart';

@JsonSerializable()
class PromoCodeResponseBody {
  final String message;
  final bool status;

  PromoCodeResponseBody(this.message, this.status);

  factory PromoCodeResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PromoCodeResponseBodyToJson(this);
}
