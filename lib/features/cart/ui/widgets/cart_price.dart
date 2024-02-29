import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

class CartPrice extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartPrice({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'EGP ${cartProduct.product.price}',
          style: AppTexts.text14BlackLatoBold,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (cartProduct.product.discount != 0)
          Text(
            'EGP ${cartProduct.product.oldPrice}',
            style: AppTexts.text14GreyLatoBold.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
