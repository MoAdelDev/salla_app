import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/core/networking/dio_factory.dart';
import 'package:salla_app/features/cart/data/repos/cart_repo.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/favorites/data/repos/favorites_repo.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home/data/repos/home_repo.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home_body/data/repos/home_body_repo.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/login/data/repos/login_repo.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_cubit.dart';
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

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // home body
  getIt.registerLazySingleton<HomeBodyRepo>(() => HomeBodyRepo(getIt()));
  getIt.registerFactory<HomeBodyCubit>(() => HomeBodyCubit(getIt()));

  // favorites
  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));

  // product details
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()));
  getIt.registerFactory<ProductDetailsCubit>(
      () => ProductDetailsCubit(getIt<ProductDetailsRepo>()));

  // cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
}
