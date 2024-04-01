import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_app_bar.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_banner.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_categories.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_products.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeAppBar(
              products: context.read<HomeBodyCubit>().products,
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeBanner(),
          ),
          const SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: HomeCategories(),
            floating: true,
            snap: true,
            elevation: 3.0,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
          ),
          const SliverToBoxAdapter(
            child: HomeProducts(),
          ),
        ],
      ),
    );
  }
}
