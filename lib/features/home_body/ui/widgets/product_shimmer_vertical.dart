import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductShimmerVertical extends StatelessWidget {
  const ProductShimmerVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Row(
        children: [
          CustomShimmer(
            radius: 10.0,
            width: 50.w,
            height: 50.h,
          ),
          horizontalSpace(5.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.0.h,
                  width: 200.w,
                  child: const CustomShimmer(),
                ),
                verticalSpace(5.0),
                SizedBox(
                  height: 12.0.h,
                  width: 180.w,
                  child: const CustomShimmer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
