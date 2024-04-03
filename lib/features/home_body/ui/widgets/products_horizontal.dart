import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_horizontal.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_tile_horizontal.dart';

class ProductsHorizontal extends StatelessWidget {
  const ProductsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        List<ProductModel> products = context.read<HomeBodyCubit>().products;
        if (products.isEmpty ||
            context.read<HomeBodyCubit>().isProductsLoading) {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.85,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              6,
              (index) => const ProductShimmerHorizontal(),
            ),
          );
        }
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.85,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            context.read<HomeBodyCubit>().products.length,
            (index) => ProductTileHorizontal(
              productModel: context.read<HomeBodyCubit>().products[index],
            ),
          ),
        );
      },
    );
  }
}
