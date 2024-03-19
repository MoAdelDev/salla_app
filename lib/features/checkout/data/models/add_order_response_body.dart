import 'package:json_annotation/json_annotation.dart';
part 'add_order_response_body.g.dart';

@JsonSerializable()
class AddOrderResponseBody {
  final bool status;
  final String message;

  AddOrderResponseBody(this.status, this.message);

  factory AddOrderResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddOrderResponseBodyFromJson(json);
}
