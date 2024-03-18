import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/favorites/data/models/favorite_remove_response.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
part 'favorites_state.freezed.dart';

@freezed
sealed class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;

  const factory FavoritesState.loading() = Loading;

  const factory FavoritesState.success(FavoritesResponse response) = Success;

  const factory FavoritesState.failure(String error) = Failure;

  const factory FavoritesState.removeFavoriteLoading() = RemoveFavoriteLoading;

  const factory FavoritesState.removeFavoriteSuccess(
      FavoriteRemoveResponse response) = RemoveFavoriteSuccess;

  const factory FavoritesState.removeFavoriteFailure(String error) =
      RemoveFavoriteFailure;

  const factory FavoritesState.removeAllFavoritesLoading() =
      RemoveAllFavoritesLoading;

  const factory FavoritesState.removeAllFavoritesSuccess() =
      RemoveAllFavoritesSuccess;

  const factory FavoritesState.removeAllFavoritesFailure(String error) =
      RemoveAllFavoritesFailure;
}
