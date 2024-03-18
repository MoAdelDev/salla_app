import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_body_request.g.dart';

@JsonSerializable()
class RegisterBodyRequest {
  final String name;
  final String email;
  final String phone;
  final String image;
  final String password;

  RegisterBodyRequest(
    this.name,
    this.email,
    this.phone,
    this.image,
    this.password,
  );

  Map<String, dynamic> toJson() => _$RegisterBodyRequestToJson(this);
}
