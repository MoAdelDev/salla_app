import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';

class CheckoutTitle extends StatelessWidget {
  final String text;
  const CheckoutTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
      ),
      child: Text(
        text,
        style: AppTexts.text18BlackLatoBold,
      ),
    );
  }
}
