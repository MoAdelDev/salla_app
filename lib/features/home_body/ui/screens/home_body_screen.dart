import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_app_bar.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_banner.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_categories.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_products.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_title.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const HomeBanner(),
          HomeTitle(
            text: S.of(context).categoriesTitle,
          ),
          SizedBox(
            height: 40.0.h,
            child: const HomeCategories(),
          ),
          HomeTitle(
            text: S.of(context).productsTitle,
          ),
          const HomeProducts(),
        ],
      ),
    );
  }
}
