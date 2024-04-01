import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.userLoading() = UserLoading;
  const factory HomeState.userSuccess({required UserModel userModel}) =
      UserSuccess;
  const factory HomeState.userError({required String message}) = UserError;

  const factory HomeState.changeIndex({required int currentIndex}) =
      ChangeIndex;
}
