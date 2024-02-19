import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomDiscountContainer extends StatelessWidget {
  final int discount;
  const CustomDiscountContainer({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary.withOpacity(0.6),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w),
      padding: EdgeInsets.symmetric(
        horizontal: 5.0.w,
        vertical: 3.0.h,
      ),
      child: Text(
        '- $discount %',
        style: AppTexts.text14WhiteLatoRegular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
