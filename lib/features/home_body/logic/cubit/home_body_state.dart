import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/products_response.dart';

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

  const factory HomeBodyState.changeCategoryId(int categoryId) =
      ChangeCategoryId;

  const factory HomeBodyState.productsLoading() = ProductsLoading;

  const factory HomeBodyState.productsSuccess(List<ProductModel> products) =
      ProductsSuccess;

  const factory HomeBodyState.productsError() = ProductsError;

  const factory HomeBodyState.changeFavoriteLoading(
      int productId, bool inFavorites) = ChangeFavoriteLoading;

  const factory HomeBodyState.changeFavoriteSuccess() = ChangeFavoriteSuccess;

  const factory HomeBodyState.changeFavoriteError() = ChangeFavoriteError;

  const factory HomeBodyState.updateFavorites() = UpdateFavorites;

  const factory HomeBodyState.changeProductsView(
    bool isGridView,
  ) = ChangeProductsView;

  const factory HomeBodyState.changeSortBy(
    int index,
  ) = ChangeSortBy;

  const factory HomeBodyState.showSearchContainer(
    bool showSearchContainer,
  ) = ShowSearchContainer;

  const factory HomeBodyState.searchProducts(
    List<ProductModel> products,
  ) = SearchProducts;
}
