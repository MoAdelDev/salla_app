import 'package:json_annotation/json_annotation.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';

part 'edit_profile_response_body.g.dart';

@JsonSerializable()
class EditProfileResponseBody {
  final String message;
  final bool status;
  final UserModel? data;
  EditProfileResponseBody(this.message, this.status, this.data);

  factory EditProfileResponseBody.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseBodyFromJson(json);
}
