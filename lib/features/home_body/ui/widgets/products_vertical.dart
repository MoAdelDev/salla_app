import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_vertical.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_tile_vertical.dart';

import '../../../favorites/logic/cubit/favorites_cubit.dart';

class ProductsVertical extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsVertical({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        if (products.isEmpty ||
            context.read<HomeBodyCubit>().isProductsLoading) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return const ProductShimmerVertical();
            },
            separatorBuilder: (context, index) {
              return verticalSpace(10.0);
            },
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            ProductModel productModel = products[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () {
                context.read<HomeBodyCubit>().emitChangeFavoriteState(
                      product: productModel,
                      favoritesCubit: context.read<FavoritesCubit>(),
                    );
              },
              child: ProductTileVertical(productModel: productModel),
            );
          },
          separatorBuilder: (context, index) {
            return verticalSpace(10.0);
          },
          itemCount: products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
