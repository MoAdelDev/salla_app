import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';
part 'register_body_response.g.dart';

@JsonSerializable()
class RegisterBodyResponse {
  final bool status;
  final String message;
  @JsonKey(name: 'data')
  final UserModel? data;

  RegisterBodyResponse(this.status, this.message, this.data);

  factory RegisterBodyResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyResponseFromJson(json);
}
