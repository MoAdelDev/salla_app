import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/core/networking/dio_factory.dart';
import 'package:salla_app/features/login/data/repos/login_repo.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/register/data/repos/register_repo.dart';
import 'package:salla_app/features/register/logic/cubit/register_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getInstance();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
