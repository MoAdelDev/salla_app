import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          height: 100.0.h,
          child: const CustomShimmer(),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(10.0),
      itemCount: 20,
    );
  }
}
