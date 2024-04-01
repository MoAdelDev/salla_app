import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomDiscountContainer extends StatelessWidget {
  final int discount;
  const CustomDiscountContainer({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 2.0.h,
      ),
      child: Text(
        '- $discount %',
        style: AppTexts.text14WhiteLatoBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
