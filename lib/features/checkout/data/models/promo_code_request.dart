import 'package:json_annotation/json_annotation.dart';
part 'promo_code_request.g.dart';

@JsonSerializable()
class PromoCodeRequest {
  final int code;
  const PromoCodeRequest({
    required this.code,
  });

  Map<String, dynamic> toJson() => _$PromoCodeRequestToJson(this);
}
