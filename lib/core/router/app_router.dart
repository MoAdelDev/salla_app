import 'package:flutter/material.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/features/on_boarding/ui/screens/intro_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      default:
        return null;
    }
  }
}
