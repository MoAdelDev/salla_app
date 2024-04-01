import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;

  const factory SettingsState.logoutLoading() = LogoutLoading;

  const factory SettingsState.logoutSuccess(String message) = LogoutSuccess;

  const factory SettingsState.logoutError(String message) = LogoutError;
}
