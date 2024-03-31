import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cancellation_response_body.g.dart';

@JsonSerializable()
class OrderCacnellationResponseBody {
  final bool status;
  final String? message;

  OrderCacnellationResponseBody(this.status, this.message);

  factory OrderCacnellationResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OrderCacnellationResponseBodyFromJson(json);
}
