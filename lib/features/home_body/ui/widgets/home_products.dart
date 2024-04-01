import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_product_tile.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        List<ProductModel> products = context.read<HomeBodyCubit>().products;
        if (products.isEmpty ||
            context.read<HomeBodyCubit>().isProductsLoading) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return const ProductShimmer();
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
            return HomeProductTile(productModel: productModel);
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
