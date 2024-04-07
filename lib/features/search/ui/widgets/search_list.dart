import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/search/ui/widgets/search_tile.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        final products = context.read<HomeBodyCubit>().filteredProducts;
        return ListView.separated(
          itemBuilder: (context, index) {
            final product = products[index];
            return SearchTile(
              product: product,
            );
          },
          separatorBuilder: (context, index) {
            return verticalSpace(10.0);
          },
          itemCount: products.length,
        );
      },
    );
  }
}
