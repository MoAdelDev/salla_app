import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGreyColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
          vertical: 20.0.h,
        ),
        child: Column(
          children: [
            CustomContainerTile(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 48.0.r,
                    backgroundColor: context.colorScheme.primary,
                    child: ClipOval(
                      child: CircleAvatar(
                        radius: 45.0.r,
                        backgroundColor: Colors.grey.shade400,
                        child: const CustomShimmer(),
                      ),
                    ),
                  ),
                  horizontalSpace(10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomShimmer(
                        width: 100.0.w,
                        height: 10.0.h,
                      ),
                      verticalSpace(6.0),
                      CustomShimmer(
                        width: 150.0.w,
                        height: 10.0.h,
                      )
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(6.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                5,
                (index) => CustomContainerTile(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0.h,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0.r,
                          child: const ClipOval(
                            child: CustomShimmer(),
                          ),
                        ),
                        horizontalSpace(10.0),
                        CustomShimmer(
                          width: 100.0.w,
                          height: 10.0.h,
                        ),
                        const Spacer(),
                        CustomShimmer(
                          width: 50.0.w,
                          height: 10.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
