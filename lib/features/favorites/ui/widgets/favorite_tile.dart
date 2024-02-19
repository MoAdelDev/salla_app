import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_image_discount.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_name.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_price.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_remove.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({super.key});

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
                  const FavoriteImageDiscount(),
                  horizontalSpace(5.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FavoriteName(),
                          verticalSpace(8.0),
                          const FavoritePrice()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: FavoriteRemove(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
