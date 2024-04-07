import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_horizontal.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_vertical.dart';

class SearchFilteredProducts extends StatelessWidget {
  const SearchFilteredProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        List<ProductModel> products =
            context.read<HomeBodyCubit>().filteredProducts;
        if (context.read<HomeBodyCubit>().isProductsHorizontal) {
          return ProductsHorizontal(
            products: products,
          );
        }
        return ProductsVertical(
          products: products,
        );
      },
    );
  }
}
