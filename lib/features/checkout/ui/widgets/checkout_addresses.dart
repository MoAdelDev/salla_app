import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_address_item.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';

class CheckoutAddresses extends StatefulWidget {
  const CheckoutAddresses({super.key});

  @override
  State<CheckoutAddresses> createState() => _CheckoutAddressesState();
}

class _CheckoutAddressesState extends State<CheckoutAddresses> {
  int radioSelected = 0;
  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
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
