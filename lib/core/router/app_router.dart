import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/features/home/ui/screens/home_screen.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/login/ui/screens/login_screen.dart';
import 'package:salla_app/features/on_boarding/ui/screens/intro_screen.dart';
import 'package:salla_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
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
          builder: (context) => BlocProvider<RegisterCubit>(
            create: (context) => getIt(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
