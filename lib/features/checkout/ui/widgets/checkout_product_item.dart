import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';

class CheckoutProductItem extends StatelessWidget {
  final CartProductModel cartProduct;
  const CheckoutProductItem({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(productId: cartProduct.product.id),
      ),
      child: Row(
        children: [
          CustomImageAndDiscount(
            image: cartProduct.product.image,
            discount: cartProduct.product.discount,
          ),
          horizontalSpace(8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle(title: cartProduct.product.name),
                verticalSpace(5.0),
                ProductPrice(
                  price: cartProduct.product.price,
                  oldPrice: cartProduct.product.oldPrice,
                  discount: cartProduct.product.discount,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
