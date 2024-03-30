import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.loading() = Loading;

  const factory EditProfileState.success({required String message}) = Success;

  const factory EditProfileState.error({required String message}) = Error;

  const factory EditProfileState.pickImageState() = PickImageState;
}
