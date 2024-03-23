import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/data/repos/favorites_repo.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_state.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

class FavoritesCubit extends BaseSafeCubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;
  FavoritesCubit(this.favoritesRepo) : super(const FavoritesState.initial());

  List<FavoriteModel> favorites = [];
  void emitFavoritesState() async {
    safeEmit(const FavoritesState.loading());
    final response = await favoritesRepo.getFavorites();

    response.when(
      success: (FavoritesResponse response) {
        favorites = response.data?.favorites ?? [];
        safeEmit(FavoritesState.success(response));
      },
      failure: (error) => safeEmit(
        FavoritesState.failure(error),
      ),
    );
  }

  Future<void> emitRemoveFavoriteState(
      FavoriteModel favoriteModel, HomeBodyCubit cubit) async {
    safeEmit(const FavoritesState.removeFavoriteLoading());
    final response = await favoritesRepo.removeFavorite(id: favoriteModel.id);
    response.when(
      success: (response) {
        cubit.updateFavorites(favoriteModel.product.id, false);
        favorites.removeWhere((element) => element.id == favoriteModel.id);
        safeEmit(
          FavoritesState.removeFavoriteSuccess(response),
        );
      },
      failure: (error) => safeEmit(
        FavoritesState.removeFavoriteFailure(error),
      ),
    );
  }

  Future<void> emitRemoveAllFavoriteState(HomeBodyCubit cubit) async {
    safeEmit(const FavoritesState.removeAllFavoritesLoading());
    List<FavoriteModel> favoritesCopy = List.from(favorites);
    for (FavoriteModel favorite in favoritesCopy) {
      await emitRemoveFavoriteState(favorite, cubit);
    }
  }
}
