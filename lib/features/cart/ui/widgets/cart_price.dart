import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductPrice extends StatelessWidget {
  final ProductModel product;
  const ProductPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'EGP ${product.price}',
          style: AppTexts.text14BlackLatoBold,
        ),
        horizontalSpace(5.0),
        if (product.discount != 0)
          Text(
            'EGP ${product.oldPrice}',
            style: AppTexts.text14GreyLatoBold.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
