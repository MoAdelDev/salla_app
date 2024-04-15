import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/splash/ui/widgets/splash_brand.dart';
import 'package:salla_app/features/splash/ui/widgets/splash_logo.dart';
import 'package:salla_app/features/splash/ui/widgets/splash_title.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: const Column(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SplashTitle(),
                        SplashLogo(),
                      ],
                    ),
                  ),
                ),
                SplashBrand(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
