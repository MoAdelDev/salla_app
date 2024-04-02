import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.userData() = UserData;

  const factory ProfileState.logoutLoading() = LogoutLoading;

  const factory ProfileState.logoutSuccess(String message) = LogoutSuccess;

  const factory ProfileState.logoutError(String message) = LogoutError;
}
