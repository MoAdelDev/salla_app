import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductPrice extends StatelessWidget {
  final ProductModel productModel;
  const ProductPrice({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'EGP ${productModel.price}',
          style: AppTexts.text14BlackLatoBold,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (productModel.discount != 0)
          Expanded(
            child: Text(
              '${productModel.oldPrice}',
              overflow: TextOverflow.ellipsis,
              style: AppTexts.text14GreyLatoBold.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
      ],
    );
  }
}
