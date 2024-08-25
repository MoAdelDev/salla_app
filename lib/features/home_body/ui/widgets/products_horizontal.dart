import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_horizontal.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_tile_horizontal.dart';

import '../../../favorites/logic/cubit/favorites_cubit.dart';

class ProductsHorizontal extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsHorizontal({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
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
            products.length,
            (index) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () {
                context.read<HomeBodyCubit>().emitChangeFavoriteState(
                      product: products[index],
                      favoritesCubit: context.read<FavoritesCubit>(),
                    );
              },
              child: ProductTileHorizontal(
                productModel: products[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
