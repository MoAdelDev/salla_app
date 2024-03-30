import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salla_app/core/networking/api_service.dart';
import 'package:salla_app/core/networking/dio_factory.dart';
import 'package:salla_app/core/stripe/stripe_api_service.dart';
import 'package:salla_app/core/stripe/stripe_service.dart';
import 'package:salla_app/features/cart/data/repos/cart_repo.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/checkout/data/repos/add_order_repo.dart';
import 'package:salla_app/features/checkout/data/repos/addresses_repo.dart';
import 'package:salla_app/features/checkout/data/repos/payment_repo.dart';
import 'package:salla_app/features/checkout/data/repos/promo_code_repo.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
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
import 'package:salla_app/features/search/logic/cubit/search_cubit.dart';
import 'package:salla_app/features/settings/data/repos/logout_repo.dart';
import 'package:salla_app/features/settings/logic/cubit/settings_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getInstance();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Stripe Api Service
  getIt.registerLazySingleton<StripeApiService>(() => StripeApiService(dio));
  getIt.registerLazySingleton<StripeService>(() => StripeService(getIt()));

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

  // checkout
  getIt.registerLazySingleton<AddressesRepo>(() => AddressesRepo(getIt()));
  getIt.registerLazySingleton<PromoCodeRepo>(() => PromoCodeRepo(getIt()));
  getIt.registerLazySingleton<AddOrderRepo>(() => AddOrderRepo(getIt()));
  getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
  getIt.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(
      getIt<PromoCodeRepo>(),
      getIt<AddressesRepo>(),
      getIt<AddOrderRepo>(),
      getIt<PaymentRepo>(),
    ),
  );

  // search
  getIt.registerFactory<SearchCubit>(() => SearchCubit());

  // settings
  getIt
      .registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt<ApiService>()));

  getIt
      .registerFactory<SettingsCubit>(() => SettingsCubit(getIt<LogoutRepo>()));

  // Edit Profile
  getIt.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepo(getIt<ApiService>()));
  getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));
}
