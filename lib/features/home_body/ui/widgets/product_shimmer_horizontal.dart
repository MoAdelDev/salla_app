import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductShimmerHorizontal extends StatelessWidget {
  const ProductShimmerHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        children: [
          CustomShimmer(
            radius: 5.0,
            width: 50.w,
            height: 50.h,
          ),
          verticalSpace(10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.0.h,
                width: 100.w,
                child: const CustomShimmer(),
              ),
              verticalSpace(5.0),
              SizedBox(
                height: 8.0.h,
                width: 80.w,
                child: const CustomShimmer(),
              ),
              verticalSpace(5.0),
              SizedBox(
                height: 8.0.h,
                width: 80.w,
                child: const CustomShimmer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
