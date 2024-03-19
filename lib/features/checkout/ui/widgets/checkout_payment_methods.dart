import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_method_item.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutPaymentMethods extends StatefulWidget {
  const CheckoutPaymentMethods({super.key});

  @override
  State<CheckoutPaymentMethods> createState() => _CheckoutPaymentMethodsState();
}

class _CheckoutPaymentMethodsState extends State<CheckoutPaymentMethods> {
  int selectedRadio = 1;
  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: Column(
        children: [
          CheckoutPaymentMethodItem(
            onChanged: (p0) {
              setState(() {
                selectedRadio = p0!;
              });
            },
            radioSelected: selectedRadio,
            radioValue: 1,
            title: S.of(context).cashOnDeliveryTitle,
            subtitle: S.of(context).cashOnDeliveryBody,
            icon: Icons.clean_hands,
          ),
          verticalSpace(10.0),
          CheckoutPaymentMethodItem(
            onChanged: (p0) {
              setState(() {
                selectedRadio = p0!;
              });
            },
            radioSelected: selectedRadio,
            radioValue: 2,
            title: S.of(context).paymentTitle,
            subtitle: S.of(context).paymentBody,
            icon: Icons.credit_card,
          ),
        ],
      ),
    );
  }
}
