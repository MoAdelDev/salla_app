import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_body_state.freezed.dart';

@freezed
sealed class HomeBodyState with _$HomeBodyState {
  const factory HomeBodyState.initial() = _Initial;

  const factory HomeBodyState.bannersLoading() = _BannersLoading;

  const factory HomeBodyState.bannersSuccess() = BannersSuccess;

  const factory HomeBodyState.bannersError() = BannersError;

  const factory HomeBodyState.categoriesLoading() = CategoriesLoading;

  const factory HomeBodyState.categoriesSuccess() = CategoriesSuccess;

  const factory HomeBodyState.categoriesError() = CategoriesError;
}