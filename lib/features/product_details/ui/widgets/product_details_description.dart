import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductDetailsDescription extends StatelessWidget {
  final String description;
  const ProductDetailsDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Text(
        description,
        style: AppTexts.text14BlackLatoRegular,
      ),
    );
  }
}
