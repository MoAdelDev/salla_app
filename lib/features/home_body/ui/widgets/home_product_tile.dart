import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_favorite.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_image_discount.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';

class HomeProductTile extends StatelessWidget {
  final ProductModel productModel;
  const HomeProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routes.productDetails,
          arguments: ProductDetailsScreenArgs(productId: productModel.id),
        );
      },
      child: CustomContainerTile(
        child: Row(
          children: [
            ProductImageDiscount(productModel: productModel),
            horizontalSpace(5.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: productModel.name,
                  ),
                  verticalSpace(5.0),
                  Row(
                    children: [
                      Expanded(
                        child: ProductPrice(
                          productModel: productModel,
                        ),
                      ),
                      ProductFavorite(productId: productModel.id)
                    ],
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
