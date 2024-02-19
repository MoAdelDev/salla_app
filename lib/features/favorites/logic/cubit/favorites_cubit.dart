import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/data/repos/favorites_repo.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_state.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;
  FavoritesCubit(this.favoritesRepo) : super(const FavoritesState.initial());

  List<FavoriteModel> favorites = [];
  void emitFavoritesState() async {
    emit(const FavoritesState.loading());
    final response = await favoritesRepo.getFavorites();

    response.when(
      success: (FavoritesResponse response) {
        favorites = response.data?.favorites ?? [];
        emit(FavoritesState.success(response));
      },
      failure: (error) => emit(
        FavoritesState.failure(error),
      ),
    );
  }

  void emitRemoveFavoriteState(int id, BuildContext context) async {
    emit(const FavoritesState.removeFavoriteLoading());
    final response = await favoritesRepo.removeFavorite(id: id);
    response.when(
      success: (response) {
        context.read<HomeBodyCubit>().favorites[id] = false;
        emit(
          FavoritesState.removeFavoriteSuccess(response),
        );
      },
      failure: (error) => emit(
        FavoritesState.removeFavoriteFailure(error),
      ),
    );
  }

  void emitRemoveAllFavoriteState(BuildContext context) async {
    emit(const FavoritesState.removeFavoriteLoading());
    favorites.map((e) {
      context.read<HomeBodyCubit>().favorites[e.id] = false;
      emit(const FavoritesState.removeAllFavoritesSuccess());
    });
  }
}
