import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductDetailsNameAndPrice extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsNameAndPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: AppTexts.text16BlackLatoBold,
            overflow: TextOverflow.visible,
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Text(
                'EGP ${product.price}',
                style: AppTexts.text16PrimaryLatoBold,
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
          ),
        ],
      ),
    );
  }
}
