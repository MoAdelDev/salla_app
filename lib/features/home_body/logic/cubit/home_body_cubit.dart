import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/data/entities/products_sort.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/data/repos/home_body_repo.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

class HomeBodyCubit extends BaseSafeCubit<HomeBodyState> {
  final HomeBodyRepo _homeBodyRepo;
  HomeBodyCubit(this._homeBodyRepo) : super(const HomeBodyState.initial());

  List<BannerModel> banners = [];
  void emitBannersState() async {
    safeEmit(const HomeBodyState.bannersLoading());
    final response = await _homeBodyRepo.getBanners();
    response.when(
      success: (bannersResponse) {
        banners = bannersResponse.banners ?? [];
        safeEmit(const HomeBodyState.bannersSuccess());
      },
      failure: (error) => safeEmit(const HomeBodyState.bannersError()),
    );
  }

  List<CategoryModel> categories = [];
  void emitCategoriesState() async {
    safeEmit(const HomeBodyState.categoriesLoading());
    final response = await _homeBodyRepo.getCategories();
    response.when(
      success: (categoriesResponse) {
        categories = categoriesResponse.categoryData.categories ?? [];
        safeEmit(const HomeBodyState.categoriesSuccess());
      },
      failure: (error) => safeEmit(const HomeBodyState.categoriesError()),
    );
  }

  List<ProductModel> products = [];
  Map<int, bool> favorites = {};
  int categoryId = -1;
  int lastRequestedCategoryId = -1;

  void changeCategoryId({required int categoryId}) async {
    this.categoryId = categoryId;
    lastRequestedCategoryId = categoryId;
    safeEmit(HomeBodyState.changeCategoryId(categoryId));
    if (categoryId == -1) {
      await emitProductsState(-1);
    } else {
      await emitGetProductsByCategoryState(categoryId: categoryId);
    }
  }

  Future<void> emitGetProductsByCategoryState({required int categoryId}) async {
    safeEmit(const HomeBodyState.productsLoading());
    final response = await _homeBodyRepo.getProductsByCategory(
      categoryId: categoryId,
    );
    response.when(
      success: (productsResponse) {
        if (lastRequestedCategoryId == categoryId) {
          products = productsResponse.productsData.products ?? [];
          safeEmit(HomeBodyState.productsSuccess(products));
        }
      },
      failure: (error) {
        safeEmit(const HomeBodyState.productsError());
      },
    );
  }

  Future<void> emitProductsState(int categoryId) async {
    safeEmit(const HomeBodyState.productsLoading());
    final response = await _homeBodyRepo.getProducts();
    response.when(
      success: (productsResponse) {
        if (lastRequestedCategoryId == categoryId) {
          products = productsResponse.productsData.products ?? [];
          List.generate(
            products.length,
            (index) => favorites.addAll(
              {products[index].id: products[index].inFavorites},
            ),
          );
          safeEmit(HomeBodyState.productsSuccess(products));
        }
      },
      failure: (error) {
        safeEmit(const HomeBodyState.productsError());
      },
    );
  }

  void updateFavorites(int id, bool isFavorite) {
    favorites[id] = isFavorite;
  }

  void emitChangeFavoriteState(
      {required ProductModel product,
      required FavoritesCubit favoritesCubit}) async {
    favorites[product.id] = !favorites[product.id]!;
    safeEmit(HomeBodyState.changeFavoriteLoading(
      product.id,
      favorites[product.id]!,
    ));
    final response = await _homeBodyRepo.changeFavorite(
      changeFavoriteRequest: ChangeFavoriteRequest(product.id),
    );
    response.when(
      success: (favoriteResponse) {
        if (favorites[product.id] ?? false) {
          favoritesCubit.emitAddFavoriteState(
              product, favoriteResponse.data?.id ?? 0);
        } else {
          favoritesCubit.emitRemoveFromFavoritesState(this, product.id);
        }
        safeEmit(const HomeBodyState.changeFavoriteSuccess());
      },
      failure: (error) {
        favorites[product.id] = !favorites[product.id]!;
        safeEmit(const HomeBodyState.changeFavoriteError());
      },
    );
  }

  bool isGridView = false;
  void emitChangeProductsViewState() {
    isGridView = !isGridView;
    safeEmit(HomeBodyState.changeProductsView(isGridView));
  }

  int sortByIndex = 0;
  void emitChangeSortByState({required int index}) {
    sortByIndex = index;
    safeEmit(HomeBodyState.changeSortBy(index));
  }

  void emitSortByState() {
    ProductsSort.sorts[sortByIndex].call(products);
    safeEmit(HomeBodyState.productsSuccess(products));
  }

  bool isSearchContainerVisible = false;
  void emitShowSearchContainerState(bool isSearchContainerVisible) {
    this.isSearchContainerVisible = isSearchContainerVisible;
    safeEmit(HomeBodyState.showSearchContainer(isSearchContainerVisible));
  }

  final TextEditingController searchController = TextEditingController();
  List<ProductModel> filteredProducts = [];
  void emitSearhcState(String text) {
    safeEmit(const HomeBodyState.initial());
    if (text.isEmpty) {
      filteredProducts = [];
    } else {
      filteredProducts = products
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    safeEmit(HomeBodyState.searchProducts(filteredProducts));
  }
}
