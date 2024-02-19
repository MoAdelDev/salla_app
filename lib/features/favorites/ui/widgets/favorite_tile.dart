import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_image_discount.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_name.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_price.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_remove.dart';

class FavoriteTile extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteTile({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FavoriteImageDiscount(product: favoriteModel.product),
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
      ),
    );
  }
}
