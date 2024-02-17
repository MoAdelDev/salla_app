import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/core/networking/api_error_model.dart';
part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel error) = Failure<T>;
}