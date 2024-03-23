import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/search/ui/widgets/search_tile.dart';

class SearchList extends StatelessWidget {
  final List<ProductModel> products;
  const SearchList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
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
  }
}
