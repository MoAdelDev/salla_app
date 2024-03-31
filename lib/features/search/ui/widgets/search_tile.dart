import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_price.dart';
import 'package:salla_app/features/cart/ui/widgets/product_name.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class SearchTile extends StatelessWidget {
  final ProductModel product;
  const SearchTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(
          productId: product.id,
        ),
      ),
      child: CustomContainerTile(
        child: Column(
          children: [
            Row(
              children: [
                CustomImageAndDiscount(
                  image: product.image,
                  discount: product.discount,
                ),
                horizontalSpace(5.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductName(name: product.name),
                        verticalSpace(8.0),
                        ProductPrice(product: product)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
