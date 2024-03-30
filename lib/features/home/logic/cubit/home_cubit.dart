import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/features/cart/ui/screens/cart_screen.dart';
import 'package:salla_app/features/favorites/ui/screens/favorites_screen.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';
import 'package:salla_app/features/home/data/repos/home_repo.dart';
import 'package:salla_app/features/home/logic/cubit/home_state.dart';
import 'package:salla_app/features/home_body/ui/screens/home_body_screen.dart';
import 'package:salla_app/features/settings/ui/screens/settings_screen.dart';

class HomeCubit extends BaseSafeCubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<Widget> screens = [
    const HomeBodyScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];
  UserModel? userModel;
  void emitUserState() async {
    safeEmit(const HomeState.userLoading());
    final response = await _homeRepo.getUser();
    response.when(
      success: (data) async {
        userModel = data.userModel;
        final userAvatar = await _homeRepo.getUserAvatar('${userModel?.id}');
        userAvatar.when(success: (url) {
          userModel?.avatar = url;
          safeEmit(HomeState.userSuccess(userModel: userModel!));
          showToast('ImageUrl : ${userModel?.avatar}');
        }, failure: (error) {
          safeEmit(HomeState.userError(message: error));
        });
      },
      failure: (error) {
        safeEmit(HomeState.userError(message: error));
      },
    );
  }
}
