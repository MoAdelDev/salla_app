import 'package:bloc/bloc.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/features/profile/data/repos/logout_repo.dart';
import 'package:salla_app/features/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final LogoutRepo _logoutRepo;
  ProfileCubit(this._logoutRepo) : super(const ProfileState.initial());

  void emitLogoutState() async {
    emit(const ProfileState.logoutLoading());
    final response = await _logoutRepo.logout();
    response.when(
      success: (data) async {
        await CacheHelper.saveToken('');
        emit(ProfileState.logoutSuccess(data.message));
      },
      failure: (message) => emit(ProfileState.logoutError(message)),
    );
  }

  void emitUserDataState() async {
    emit(const ProfileState.initial());
    emit(const ProfileState.userData());
  }
}
