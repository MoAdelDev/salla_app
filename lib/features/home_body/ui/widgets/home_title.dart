import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class HomeTitle extends StatelessWidget {
  final String text;
  const HomeTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.w,
        vertical: 10.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTexts.text28BlackShadowLatoBold,
          ),
          Container(
            color: context.colorScheme.primary,
            height: 3.0.h,
            width: 70.0.w,
          ),
        ],
      ),
    );
  }
}
