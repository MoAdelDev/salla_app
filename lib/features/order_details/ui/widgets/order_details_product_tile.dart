import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';

class OrderDetailsProductTile extends StatelessWidget {
  final OrderDetailsProductModel product;
  const OrderDetailsProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(productId: product.id),
      ),
      child: Row(
        children: [
          CustomImageAndDiscount(
            image: product.image,
            discount: 0,
          ),
          horizontalSpace(8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle(title: product.name),
                verticalSpace(5.0),
                Row(
                  children: [
                    Text(
                      'Quantity -> ${product.quantity}',
                      style: AppTexts.text12BlackLatoRegular,
                    ),
                    const Spacer(),
                    ProductPrice(
                      price: product.price,
                      oldPrice: 0,
                      discount: 0,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
