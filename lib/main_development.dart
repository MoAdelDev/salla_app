import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/salla_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  // for splash screen duration
  await Future.delayed(const Duration(milliseconds: 1700));
  runApp(SallaApp(
    appRouter: AppRouter(),
  ));
}