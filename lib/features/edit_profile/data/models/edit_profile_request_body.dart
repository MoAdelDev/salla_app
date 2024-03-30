import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {
  final String name;
  final String email;
  final String phone;

  EditProfileRequestBody(this.name, this.email, this.phone);

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}
