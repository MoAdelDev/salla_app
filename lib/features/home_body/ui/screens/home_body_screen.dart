import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeAppBar(
            products: context.read<HomeBodyCubit>().products,
          ),
        ),
        const SliverToBoxAdapter(
          child: HomeBanner(),
        ),
        SliverToBoxAdapter(
          child: HomeTitle(
            text: S.of(context).categoriesTitle,
          ),
        ),
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: const HomeCategories(),
          expandedHeight: 40.0.h,
          floating: true,
          snap: true,
          elevation: 0.0,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.white,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitle(
                text: S.of(context).productsTitle,
              ),
              const HomeProducts(),
            ],
          ),
        ),
      ],
    );
  }
}
