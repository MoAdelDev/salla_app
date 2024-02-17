import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String phone;
  final int id;
  final String token;
  final int points;
  final dynamic credits;

  UserModel(
    this.name,
    this.email,
    this.phone,
    this.id,
    this.token,
    this.points,
    this.credits,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
