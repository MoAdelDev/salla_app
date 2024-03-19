import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';

class CheckoutTitle extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final String? textButton;
  const CheckoutTitle({
    super.key,
    required this.text,
    this.onTap,
    this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: onTap != null ? 3.0.h : 10.0.h,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: AppTexts.text18BlackLatoBold,
          ),
          const Spacer(),
          if (onTap != null)
            CustomTextButton(
              onPressed: onTap ?? () {},
              text: textButton ?? '',
            ),
        ],
      ),
    );
  }
}
