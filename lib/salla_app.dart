import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/themes.dart';
import 'package:salla_app/generated/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class SallaApp extends StatelessWidget {
  final AppRouter appRouter;
  const SallaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        initialRoute: Routes.intro,
        onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
        locale: const Locale('en', 'US'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
