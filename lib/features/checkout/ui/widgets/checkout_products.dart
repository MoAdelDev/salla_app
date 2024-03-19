import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_product_item.dart';

class CheckoutProducts extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  const CheckoutProducts({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return CheckoutProductItem(
            cartProduct: product,
          );
        },
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => verticalSpace(10.0),
        itemCount: cartProducts.length,
      ),
    );
  }
}
