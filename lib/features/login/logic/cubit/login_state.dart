import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success(LoginResponseBody data) = LoginSuccess;

  const factory LoginState.failure(String error) = LoginFailure;
}
