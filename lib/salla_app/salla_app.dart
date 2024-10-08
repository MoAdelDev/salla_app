import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/localization/generated/l10n.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/themes.dart';
import 'package:salla_app/salla_app/locale_cubit.dart';

class SallaApp extends StatelessWidget {
  final AppRouter appRouter;
  const SallaApp({
    super.key,
    required this.appRouter,
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
              theme: lightTheme(context, locale),
              initialRoute: Routes.splash,
              onGenerateRoute: (settings) =>
                  appRouter.onGenerateRoute(settings),
              locale: locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.delegate.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
