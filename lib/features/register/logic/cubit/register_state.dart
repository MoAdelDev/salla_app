import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/register/data/models/register_body_response.dart';
part 'register_state.freezed.dart';

@freezed
sealed class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = RegisterLoading;

  const factory RegisterState.success(RegisterBodyResponse data) =
      RegisterSuccess;

  const factory RegisterState.error(String message) = RegisterError;
}
