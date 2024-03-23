import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = Loading;

  const factory SearchState.success() = Success;

  const factory SearchState.failure(String message) = Failure;
}
