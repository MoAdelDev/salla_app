import 'package:freezed_annotation/freezed_annotation.dart';
part 'ephemeral_key_request_body.g.dart';

@JsonSerializable()
class EphemeralKeyRequestBody {
  @JsonKey(name: 'customer')
  final String customerId;

  EphemeralKeyRequestBody(this.customerId);

  Map<String, dynamic> toJson() => _$EphemeralKeyRequestBodyToJson(this);
}
