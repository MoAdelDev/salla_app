import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_product_item.dart';

class CheckoutProducts extends StatelessWidget {
  const CheckoutProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CheckoutProductItem();
        },
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => verticalSpace(10.0),
        itemCount: 4,
      ),
    );
  }
}
