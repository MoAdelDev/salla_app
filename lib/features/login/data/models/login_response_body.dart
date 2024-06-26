import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final bool status;
  final String message;
  @JsonKey(name: 'data')
  final UserModel? data;

  LoginResponseBody(
    this.status,
    this.message,
    this.data,
  );

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
