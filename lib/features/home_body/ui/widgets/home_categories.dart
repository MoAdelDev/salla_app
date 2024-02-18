import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/ui/widgets/category_tile.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return horizontalSpace(10.0);
          },
          itemBuilder: (BuildContext context, int index) {
            return const CategoryTile(
              isSelected: true,
            );
          }),
    );
  }
}
