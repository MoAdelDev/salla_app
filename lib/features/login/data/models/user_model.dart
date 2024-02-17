import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String phone;
  final int id;
  final String token;

  UserModel(
    this.name,
    this.email,
    this.phone,
    this.id,
    this.token,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
