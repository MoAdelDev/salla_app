import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            child: ClipOval(
              child: CustomShimmer(),
            ),
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
