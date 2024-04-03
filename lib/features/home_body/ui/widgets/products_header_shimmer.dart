import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductsHeaderShimmer extends StatelessWidget {
  const ProductsHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.0.h,
          width: 80.0.h,
          child: const CustomShimmer(),
        ),
        const Spacer(),
        Row(
          children: List.generate(
            2,
            (index) => Row(
              children: [
                Container(
                  height: 25.0.h,
                  width: 25.0.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: const CustomShimmer(),
                ),
                horizontalSpace(10.0),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}
