import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_response_body.g.dart';

@JsonSerializable()
class LogoutResponseBody {
  final String message;
  final bool status;

  LogoutResponseBody(this.message, this.status);

  factory LogoutResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseBodyFromJson(json);
}
