import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_tile.dart';

class CartList extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  const CartList({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        CartProductModel cartProduct = cartProducts[index];
        return CartTile(
          cartProduct: cartProduct,
        );
      },
      separatorBuilder: (context, index) => verticalSpace(10.0),
      itemCount: cartProducts.length,
    );
  }
}
