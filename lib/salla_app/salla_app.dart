import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/themes.dart';
import 'package:salla_app/generated/l10n.dart';
import 'package:salla_app/salla_app/locale_cubit.dart';

class SallaApp extends StatelessWidget {
  final AppRouter appRouter;
  final String token;
  const SallaApp({
    super.key,
    required this.appRouter,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit()..getLanguage(context),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            useInheritedMediaQuery: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme(context),
              initialRoute: token != '' ? Routes.home : Routes.intro,
              onGenerateRoute: (settings) =>
                  appRouter.onGenerateRoute(settings),
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
