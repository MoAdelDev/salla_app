import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/router/app_router.dart';
import 'package:salla_app/salla_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(SallaApp(
    appRouter: AppRouter(),
  ));
}
