import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutCart extends StatelessWidget {
  final Widget child;
  const CheckoutCart({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0.w,
          vertical: 5.0.h,
        ),
        child: child,
      ),
    );
  }
}
