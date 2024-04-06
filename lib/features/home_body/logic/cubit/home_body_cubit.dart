import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/data/repos/home_body_repo.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/generated/l10n.dart';

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
    isProductsLoading = true;
    categoryId = -1;
    safeEmit(const HomeBodyState.productsLoading());
    final response = await _homeBodyRepo.getProducts();
    response.when(
      success: (productsResponse) {
        isProductsLoading = false;
        products = productsResponse.productsData.products ?? [];
        List.generate(
          products.length,
          (index) => favorites.addAll(
            {products[index].id: products[index].inFavorites},
          ),
        );
        safeEmit(const HomeBodyState.productsSuccess());
      },
      failure: (error) {
        isProductsLoading = false;
        safeEmit(const HomeBodyState.productsError());
      },
    );
  }

  void updateFavorites(int id, bool isFavorite) {
    favorites[id] = isFavorite;
    safeEmit(const HomeBodyState.updateFavorites());
  }

  void emitChangeFavoriteState(
      {required int productId, required BuildContext context}) async {
    favorites[productId] = !favorites[productId]!;
    safeEmit(const HomeBodyState.changeFavoriteLoading());
    final response = await _homeBodyRepo.changeFavorite(
      changeFavoriteRequest: ChangeFavoriteRequest(productId),
    );
    response.when(
      success: (favoriteResponse) {
        if (context.mounted) {
          context.read<FavoritesCubit>().emitFavoritesState();
        }
        safeEmit(const HomeBodyState.changeFavoriteSuccess());
      },
      failure: (error) {
        favorites[productId] = !favorites[productId]!;
        safeEmit(const HomeBodyState.changeFavoriteError());
      },
    );
  }

  int categoryId = -1;
  void emitGetProductsByCategoryState({required int categoryId}) async {
    isProductsLoading = true;
    this.categoryId = categoryId;
    safeEmit(const HomeBodyState.productsLoading());
    final response = await _homeBodyRepo.getProductsByCategory(
      categoryId: categoryId,
    );
    response.when(
      success: (productsResponse) {
        products = productsResponse.productsData.products ?? [];
        isProductsLoading = false;
        safeEmit(const HomeBodyState.productsSuccess());
      },
      failure: (error) {
        isProductsLoading = false;
        safeEmit(const HomeBodyState.productsError());
      },
    );
  }

  bool isProductsHorizontal = false;
  void emitChangeProductsViewState() {
    safeEmit(const HomeBodyState.initial());
    isProductsHorizontal = !isProductsHorizontal;
    safeEmit(const HomeBodyState.changeProductsView());
  }

  List<String> sortByTitles = [
    S.current.defaultTitle,
    S.current.lowestPrice,
    S.current.highestPrice,
    S.current.hasDiscount,
  ];

  int sortByIndex = 0;

  void emitChangeSortByState({required int index}) {
    safeEmit(const HomeBodyState.initial());
    sortByIndex = index;
    safeEmit(const HomeBodyState.changeSortBy());
  }

  void emitSortByState(String title) {
    safeEmit(const HomeBodyState.initial());
    if (title == S.current.defaultTitle) {
      if (categoryId == -1) {
        emitProductsState();
      } else {
        emitGetProductsByCategoryState(categoryId: categoryId);
      }
    }
    if (title == S.current.lowestPrice) {
      products.sort((a, b) => a.price.compareTo(b.price));
    }
    if (title == S.current.highestPrice) {
      products.sort((a, b) => b.price.compareTo(a.price));
    }
    if (title == S.current.hasDiscount) {
      products.sort((a, b) => b.discount.compareTo(a.discount));
    }
    safeEmit(const HomeBodyState.changeSortBy());
  }
}
