import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_name.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_price.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_quantity.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_remove.dart';

class CartTile extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartTile({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 14.0.w,
        vertical: 8.0.h,
      ),
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
                      CartName(name: cartProduct.product.name),
                      verticalSpace(8.0),
                      CartPrice(cartProduct: cartProduct)
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
