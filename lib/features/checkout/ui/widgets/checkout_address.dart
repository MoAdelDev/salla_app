import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_address_item.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({super.key});

  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  int radioSelected = 0;
  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CheckoutAddressItem(
            onChanged: (p0) {
              setState(() {
                radioSelected = p0!;
              });
            },
            value: index,
            radioSelected: radioSelected,
          );
        },
        separatorBuilder: (context, index) => verticalSpace(10.0),
        itemCount: 3,
      ),
    );
  }
}
