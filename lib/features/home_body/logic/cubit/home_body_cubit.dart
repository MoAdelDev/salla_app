import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/debouncer.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/data/repos/home_body_repo.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

import '../../../../core/localization/generated/l10n.dart';

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
  bool isProductsLoading = false;
  void emitProductsState() async {
    safeEmit(const HomeBodyState.productsLoading());
    debouncer.run(() async {
      isProductsLoading = true;
      categoryId = -1;
      lastRequestedCategoryId = -1;
      safeEmit(HomeBodyState.changeCategoryId(categoryId));
      final response = await _homeBodyRepo.getProducts();
      response.when(
        success: (productsResponse) {
          if (lastRequestedCategoryId == categoryId) {
            isProductsLoading = false;
            products = productsResponse.productsData.products ?? [];
            List.generate(
              products.length,
              (index) => favorites.addAll(
                {products[index].id: products[index].inFavorites},
              ),
            );
            safeEmit(const HomeBodyState.productsSuccess());
          }
        },
        failure: (error) {
          isProductsLoading = false;
          safeEmit(const HomeBodyState.productsError());
        },
      );
    });
  }

  void updateFavorites(int id, bool isFavorite) {
    favorites[id] = isFavorite;
  }

  void emitChangeFavoriteState(
      {required ProductModel product,
      required FavoritesCubit favoritesCubit}) async {
    favorites[product.id] = !favorites[product.id]!;
    safeEmit(const HomeBodyState.changeFavoriteLoading());
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

  int categoryId = -1;
  int lastRequestedCategoryId = -1;
  Debouncer debouncer = Debouncer(milliseconds: 300);
  void emitGetProductsByCategoryState({required int categoryId}) {
    isProductsLoading = true;
    this.categoryId = categoryId;
    lastRequestedCategoryId = categoryId;
    safeEmit(HomeBodyState.changeCategoryId(categoryId));
    safeEmit(const HomeBodyState.productsLoading());
    debouncer.run(() async {
      final response = await _homeBodyRepo.getProductsByCategory(
        categoryId: categoryId,
      );
      response.when(
        success: (productsResponse) {
          if (lastRequestedCategoryId == categoryId) {
            products = productsResponse.productsData.products ?? [];
            isProductsLoading = false;
            safeEmit(const HomeBodyState.productsSuccess());
          }
        },
        failure: (error) {
          isProductsLoading = false;
          safeEmit(const HomeBodyState.productsError());
        },
      );
    });
  }

  bool isProductsHorizontal = false;
  void emitChangeProductsViewState() {
    safeEmit(const HomeBodyState.initial());
    isProductsHorizontal = !isProductsHorizontal;
    safeEmit(const HomeBodyState.changeProductsView());
  }

  List<String> sortByTitles = [
    AppLocalizations.current.defaultTitle,
    AppLocalizations.current.lowestPrice,
    AppLocalizations.current.highestPrice,
    AppLocalizations.current.hasDiscount,
  ];

  int sortByIndex = 0;

  void emitChangeSortByState({required int index}) {
    safeEmit(const HomeBodyState.initial());
    sortByIndex = index;
    safeEmit(const HomeBodyState.changeSortBy());
  }

  void emitSortByState(String title) {
    safeEmit(const HomeBodyState.initial());
    if (title == AppLocalizations.current.defaultTitle) {
      if (categoryId == -1) {
        emitProductsState();
      } else {
        emitGetProductsByCategoryState(categoryId: categoryId);
      }
    }
    if (title == AppLocalizations.current.lowestPrice) {
      products.sort((a, b) => a.price.compareTo(b.price));
    }
    if (title == AppLocalizations.current.highestPrice) {
      products.sort((a, b) => b.price.compareTo(a.price));
    }
    if (title == AppLocalizations.current.hasDiscount) {
      products.sort((a, b) => b.discount.compareTo(a.discount));
    }
    safeEmit(const HomeBodyState.changeSortBy());
  }

  bool isSearchContainerVisible = false;
  void emitShowSearchContainerState(bool isSearchContainerVisible) {
    safeEmit(const HomeBodyState.initial());
    this.isSearchContainerVisible = isSearchContainerVisible;
    safeEmit(const HomeBodyState.showSearchContainer());
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
    safeEmit(const HomeBodyState.searchProducts());
  }
}
