import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_image_and_discount.dart';

class ProductSliverAppBar extends StatelessWidget {
  final ProductModel product;
  const ProductSliverAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height / 3,
      stretch: true,
      pinned: true,
      iconTheme: IconThemeData(color: context.colorScheme.onBackground),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            background: ProductDetailsImageAndDiscount(
              product: product,
            ),
          );
        },
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: context.colorScheme.primary,
          size: 40.0,
        ),
      ),
    );
  }
}
