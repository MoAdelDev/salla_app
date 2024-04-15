import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';

class SplashBrand extends StatelessWidget {
  const SplashBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0.h),
      child: FadeInUp(
        duration: const Duration(milliseconds: 1200),
        child: Column(
          children: [
            Text(
              'Powered by',
              style: AppTexts.text14WhiteCairoRegular,
            ),
            verticalSpace(5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/solvytix.png',
                  width: 100.0.w,
                  height: 25.0.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
