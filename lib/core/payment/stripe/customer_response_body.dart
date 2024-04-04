import 'package:json_annotation/json_annotation.dart';
part 'customer_response_body.g.dart';

@JsonSerializable()
class CustomerResponseBody {
  final String id;

  CustomerResponseBody(this.id);

  factory CustomerResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseBodyFromJson(json);
}
