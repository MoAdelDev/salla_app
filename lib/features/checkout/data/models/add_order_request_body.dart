import 'package:json_annotation/json_annotation.dart';
part 'add_order_request_body.g.dart';

@JsonSerializable()
class AddOrderRequestBody {
  @JsonKey(name: 'address_id')
  final int addressId;
  @JsonKey(name: 'payment_method')
  final int paymentMethod;
  @JsonKey(name: 'use_points')
  final bool usePoints;

  AddOrderRequestBody(
      {required this.addressId,
      required this.paymentMethod,
      required this.usePoints});

  Map<String, dynamic> toJson() => _$AddOrderRequestBodyToJson(this);
}
