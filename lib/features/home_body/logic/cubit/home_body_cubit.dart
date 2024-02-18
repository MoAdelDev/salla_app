import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
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
}
