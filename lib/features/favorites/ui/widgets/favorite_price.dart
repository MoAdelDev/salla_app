import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';

class FavoritePrice extends StatelessWidget {
  final FavoriteProductModel product;
  const FavoritePrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'EGP ${product.price}',
          style: AppTexts.text14WhiteLatoBold,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (product.discount != 0)
          Text(
            'EGP ${product.oldPrice}',
            style: AppTexts.text14BlackCairoBold.copyWith(
                decoration: TextDecoration.lineThrough,
                color: Colors.white.withOpacity(0.8)),
          ),
      ],
    );
  }
}
