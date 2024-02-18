import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/data/models/change_favorite_request.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/data/repos/home_body_repo.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

class HomeBodyCubit extends Cubit<HomeBodyState> {
  final HomeBodyRepo _homeBodyRepo;
  HomeBodyCubit(this._homeBodyRepo) : super(const HomeBodyState.initial());

  List<BannerModel> banners = [];
  void emitBannersState() async {
    emit(const HomeBodyState.bannersLoading());
    final response = await _homeBodyRepo.getBanners();
    response.when(
      success: (bannersResponse) {
        banners = bannersResponse.banners ?? [];
        emit(const HomeBodyState.bannersSuccess());
      },
      failure: (error) => emit(const HomeBodyState.bannersError()),
    );
  }

  List<CategoryModel> categories = [];
  void emitCategoriesState() async {
    emit(const HomeBodyState.categoriesLoading());
    final response = await _homeBodyRepo.getCategories();
    response.when(
      success: (categoriesResponse) {
        categories = categoriesResponse.categoryData.categories ?? [];
        emit(const HomeBodyState.categoriesSuccess());
      },
      failure: (error) => emit(const HomeBodyState.categoriesError()),
    );
  }

  List<ProductModel> products = [];
  Map<int, bool> favorites = {};
  bool isProductsLoading = false;
  void emitProductsState() async {
    isProductsLoading = true;
    emit(const HomeBodyState.productsLoading());
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
        emit(const HomeBodyState.productsSuccess());
      },
      failure: (error) {
        isProductsLoading = false;
        emit(const HomeBodyState.productsError());
      },
    );
  }

  void emitChangeFavoriteState({required int productId}) async {
    favorites[productId] = !favorites[productId]!;
    emit(const HomeBodyState.changeFavoriteLoading());
    final response = await _homeBodyRepo.changeFavorite(
      changeFavoriteRequest: ChangeFavoriteRequest(productId),
    );
    response.when(
      success: (favoriteResponse) {
        emit(const HomeBodyState.changeFavoriteSuccess());
      },
      failure: (error) {
        favorites[productId] = !favorites[productId]!;
        emit(const HomeBodyState.changeFavoriteError());
      },
    );
  }

  void emitGetProductsByCategoryState({required int categoryId}) async {
    isProductsLoading = true;
    emit(const HomeBodyState.productsLoading());
    final response = await _homeBodyRepo.getProductsByCategory(
      categoryId: categoryId,
    );
    response.when(
      success: (productsResponse) {
        products = productsResponse.productsData.products ?? [];
        isProductsLoading = false;
        emit(const HomeBodyState.productsSuccess());
      },
      failure: (error) {
        isProductsLoading = false;
        emit(const HomeBodyState.productsError());
      },
    );
  }
}
