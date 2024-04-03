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

  const factory HomeBodyState.productsLoading() = ProductsLoading;

  const factory HomeBodyState.productsSuccess() = ProductsSuccess;

  const factory HomeBodyState.productsError() = ProductsError;

  const factory HomeBodyState.changeFavoriteLoading() = ChangeFavoriteLoading;

  const factory HomeBodyState.changeFavoriteSuccess() = ChangeFavoriteSuccess;

  const factory HomeBodyState.changeFavoriteError() = ChangeFavoriteError;

  const factory HomeBodyState.updateFavorites() = UpdateFavorites;

  const factory HomeBodyState.changeProductsView() = ChangeProductsView;
}
