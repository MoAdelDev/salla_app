import 'package:bloc/bloc.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/features/settings/data/repos/logout_repo.dart';
import 'package:salla_app/features/settings/logic/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final LogoutRepo _logoutRepo;
  SettingsCubit(this._logoutRepo) : super(const SettingsState.initial());

  void emitLogoutState() async {
    emit(const SettingsState.logoutLoading());
    final response = await _logoutRepo.logout();
    response.when(
      success: (data) async {
        await CacheHelper.saveToken('');
        emit(SettingsState.logoutSuccess(data.message));
      },
      failure: (message) => emit(SettingsState.logoutError(message)),
    );
  }
}
