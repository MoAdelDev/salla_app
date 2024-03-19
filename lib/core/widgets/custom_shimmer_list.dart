import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  final int itemCount;
  final double height;
  const CustomShimmerList({super.key, this.itemCount = 20, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          height: height.h,
          child: const CustomShimmer(),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(10.0),
      itemCount: itemCount,
    );
  }
}
