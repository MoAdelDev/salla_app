import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home/ui/screens/home_screen.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/login/ui/screens/login_screen.dart';
import 'package:salla_app/features/on_boarding/ui/screens/intro_screen.dart';
import 'package:salla_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:salla_app/features/product_details/ui/screens/product_details_screen.dart';
import 'package:salla_app/features/register/logic/cubit/register_cubit.dart';
import 'package:salla_app/features/register/ui/screens/register_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>(
            create: (context) => getIt(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>(
            create: (context) => getIt(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => getIt()..emitUserState(),
              ),
              BlocProvider<HomeBodyCubit>(
                create: (context) => getIt()
                  ..emitBannersState()
                  ..emitCategoriesState()
                  ..emitProductsState(),
              ),
              BlocProvider<FavoritesCubit>(
                create: (context) => getIt()..emitFavoritesState(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetails:
        ProductDetailsScreenArgs args =
            settings.arguments as ProductDetailsScreenArgs;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            args: args,
          ),
        );
      default:
        return null;
    }
  }
}
