import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/favorites/ui/screens/favorites_screen.dart';
import 'package:salla_app/features/home/data/models/user_model.dart';
import 'package:salla_app/features/home/data/repos/home_repo.dart';
import 'package:salla_app/features/home/logic/cubit/home_state.dart';
import 'package:salla_app/features/home_body/ui/screens/home_body_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<Widget> screens = [
    const HomeBodyScreen(),
    const FavoritesScreen(),
    Container(),
    Container(),
    Container(),
  ];
  UserModel? userModel;
  void emitUserState() async {
    emit(const HomeState.userLoading());
    final response = await _homeRepo.getUser();
    response.when(
      success: (data) {
        userModel = data.userModel;
        emit(HomeState.userSuccess(userModel: userModel!));
      },
      failure: (error) {
        emit(HomeState.userError(message: error));
      },
    );
  }
}
