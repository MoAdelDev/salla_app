import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_product_tile.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        List<ProductModel> products = context.read<HomeBodyCubit>().products;
        if (products.isEmpty ||
            context.read<HomeBodyCubit>().isProductsLoading) {
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
              children: List.generate(6, (index) => const CustomShimmer()),
            ),
          );
        }
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
            children: products
                .map(
                  (e) => HomeProductTile(
                    productModel: e,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
