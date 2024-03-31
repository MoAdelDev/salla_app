import 'package:json_annotation/json_annotation.dart';

part 'delete_address_response_body.g.dart';

@JsonSerializable()
class DeleteAddressResponseBody {
  final String? message;
  final bool status;

  DeleteAddressResponseBody(this.message, this.status);

  factory DeleteAddressResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressResponseBodyFromJson(json);
}
