import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';

part 'user_response_body.g.dart';

@JsonSerializable()
class UserResponseBody {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final UserModel? userModel;

  UserResponseBody(
    this.status,
    this.message,
    this.userModel,
  );

  factory UserResponseBody.fromJson(Map<String, dynamic> json) =>
      _$UserResponseBodyFromJson(json);
}
