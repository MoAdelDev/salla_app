import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/colors.dart';

class PaymentItem extends StatelessWidget {
  final String image;
  final bool isSelected;
  const PaymentItem({
    super.key,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      margin: EdgeInsets.only(right: 10.0.w),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: isSelected ? AppColor.primaryColor : Colors.grey[300]!,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColor.primaryColor,
                  blurRadius: 8.0,
                )
              ]
            : null,
      ),
      child: Image.asset(
        image,
        height: 45.0.h,
      ),
    );
  }
}
