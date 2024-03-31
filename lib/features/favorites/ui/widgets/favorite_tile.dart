import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_name.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_price.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_remove.dart';

class FavoriteTile extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteTile({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: InkWell(
        onTap: () => context.push(
          Routes.productDetails,
          arguments: ProductDetailsScreenArgs(
            productId: favoriteModel.product.id,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageAndDiscount(
                  image: favoriteModel.product.image,
                  discount: favoriteModel.product.discount,
                ),
                horizontalSpace(5.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FavoriteName(name: favoriteModel.product.name),
                        verticalSpace(8.0),
                        FavoritePrice(product: favoriteModel.product)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: FavoriteRemove(favoriteModel: favoriteModel),
            )
          ],
        ),
      ),
    );
  }
}
