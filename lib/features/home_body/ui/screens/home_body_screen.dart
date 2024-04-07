import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_app_bar.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_banner.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_categories.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_products.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_header.dart';
import 'package:salla_app/features/home_body/ui/widgets/search_container.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (context.read<HomeBodyCubit>().isSearchContainerVisible) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.read<HomeBodyCubit>().emitShowSearchContainerState(
            false,
          );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          context.read<HomeBodyCubit>().emitShowSearchContainerState(false);
        },
        child: Container(
          color: AppColor.lightGreyColor,
          child: RefreshIndicator(
            onRefresh: context.read<HomeBodyCubit>().emitProductsState,
            notificationPredicate: (notification) => true,
            child: Column(
              children: [
                HomeAppBar(
                  products: context.read<HomeBodyCubit>().products,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: HomeBanner(),
                          ),
                          const SliverToBoxAdapter(
                            child: HomeCategories(),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(top: 10.0.h),
                          ),
                          SliverAppBar(
                            pinned: true,
                            automaticallyImplyLeading: false,
                            backgroundColor: AppColor.lightGreyColor,
                            flexibleSpace: const ProductsHeader(),
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
                      const SearchContainer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
