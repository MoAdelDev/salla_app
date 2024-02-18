import 'package:flutter/material.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_favorite.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_image_discount.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';

class HomeProductTile extends StatelessWidget {
  const HomeProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ProductImageDiscount(),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle(),
                Row(
                  children: [
                    Expanded(
                      child: ProductPrice(),
                    ),
                    ProductFavorite(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
