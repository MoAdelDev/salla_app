import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_product_tile.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      padding: EdgeInsets.symmetric(vertical: 2.0.h),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3.0,
        childAspectRatio: 1 / 1.68,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [0, 1, 2, 3, 4]
            .map(
              (e) => const HomeProductTile(),
            )
            .toList(),
      ),
    );
  }
}
