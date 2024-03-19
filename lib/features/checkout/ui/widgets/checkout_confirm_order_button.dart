import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_button.dart';

class CheckoutConfirmOrderButton extends StatelessWidget {
  const CheckoutConfirmOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        right: 15.0.w,
        left: 15.0.w,
        top: 5.0.h,
        bottom: 10.0.h,
      ),
      child: CustomButton(
        onPressed: () {},
        text: 'Confirm Order',
      ),
    );
  }
}
