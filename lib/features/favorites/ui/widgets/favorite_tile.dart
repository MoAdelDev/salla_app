import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_remove.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';

class FavoriteTile extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteTile({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(
          productId: favoriteModel.product.id,
        ),
      ),
      child: CustomContainerTile(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageAndDiscount(
              image: favoriteModel.product.image,
              discount: favoriteModel.product.discount,
            ),
            horizontalSpace(5.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(title: favoriteModel.product.name),
                  verticalSpace(8.0),
                  Row(
                    children: [
                      Expanded(
                        child: ProductPrice(
                          discount: favoriteModel.product.discount,
                          oldPrice: favoriteModel.product.oldPrice,
                          price: favoriteModel.product.price,
                        ),
                      ),
                      FavoriteRemove(favoriteModel: favoriteModel),
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
