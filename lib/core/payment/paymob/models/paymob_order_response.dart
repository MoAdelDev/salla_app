import 'package:json_annotation/json_annotation.dart';

part 'paymob_order_response.g.dart';

@JsonSerializable()
class PaymobOrderResponse {
  final int id;

  PaymobOrderResponse(this.id);

  factory PaymobOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobOrderResponseToJson(this);
}
