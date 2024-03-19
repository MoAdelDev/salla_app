import 'package:json_annotation/json_annotation.dart';
part 'promo_code_request_body.g.dart';

@JsonSerializable()
class PromoCodeRequestBody {
  final int code;
  const PromoCodeRequestBody({
    required this.code,
  });

  Map<String, dynamic> toJson() => _$PromoCodeRequestBodyToJson(this);
}
