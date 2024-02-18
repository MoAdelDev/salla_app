import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_body_state.freezed.dart';

@freezed
sealed class HomeBodyState with _$HomeBodyState {
  const factory HomeBodyState.initial() = _Initial;

  const factory HomeBodyState.bannersLoading() = _BannersLoading;

  const factory HomeBodyState.bannersSuccess() = _BannersSuccess;

  const factory HomeBodyState.bannersError() = _BannersError;
}
