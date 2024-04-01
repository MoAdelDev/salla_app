import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_image_discount.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';

class SearchTile extends StatelessWidget {
  final ProductModel product;
  const SearchTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routes.productDetails,
          arguments: ProductDetailsScreenArgs(productId: product.id),
        );
      },
      child: CustomContainerTile(
        child: Row(
          children: [
            ProductImageDiscount(productModel: product),
            horizontalSpace(5.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: product.name,
                  ),
                  verticalSpace(5.0),
                  ProductPrice(
                    discount: product.discount,
                    oldPrice: product.price,
                    price: product.oldPrice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
