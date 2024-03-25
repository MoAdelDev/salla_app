import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/my_bloc_observer.dart';
import 'package:salla_app/salla_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  final String token = await CacheHelper.token;

  runApp(SallaApp(
    appRouter: AppRouter(),
    token: token,
  ));
}
