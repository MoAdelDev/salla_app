import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_price.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_quantity.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_remove.dart';
import 'package:salla_app/features/cart/ui/widgets/product_name.dart';

class CartTile extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartTile({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        children: [
          Row(
            children: [
              CustomImageAndDiscount(
                image: cartProduct.product.image,
                discount: cartProduct.product.discount,
              ),
              horizontalSpace(5.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductName(name: cartProduct.product.name),
                      verticalSpace(8.0),
                      ProductPrice(product: cartProduct.product)
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(8.0),
          Row(
            children: [
              CartQuantity(
                cartProduct: cartProduct,
              ),
              const Spacer(),
              CartRemove(
                cartProduct: cartProduct,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
