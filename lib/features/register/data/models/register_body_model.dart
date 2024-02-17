import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_body_model.g.dart';

@JsonSerializable()
class RegisterBodyModel {
  final String name;
  final String email;
  final String phone;
  final String image;
  final String password;

  RegisterBodyModel(
    this.name,
    this.email,
    this.phone,
    this.image,
    this.password,
  );

  Map<String, dynamic> toJson() => _$RegisterBodyModelToJson(this);
}
