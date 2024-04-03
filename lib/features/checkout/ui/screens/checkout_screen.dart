import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_addresses.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_confirm_order_button.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_methods.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_products.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_summary.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutScreen extends StatelessWidget {
  final CheckoutScreenArgs args;
  const CheckoutScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGreyColor,
      body: SafeArea(
        bottom: Platform.isAndroid,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onTap1: () => context.pop(),
              icon1: Icons.chevron_left,
              title: S.of(context).checkoutTitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckoutSummary(
                      totalPrice: args.totalPrice,
                      totalItems: args.totalItems,
                    ),
                    verticalSpace(10.0),
                    const CheckoutPaymentMethods(),
                    verticalSpace(10.0),
                    const CheckoutAddresses(),
                    CheckoutProducts(
                      cartProducts: args.products,
                    ),
                  ],
                ),
              ),
            ),
            CheckoutConfirmOrderButton(
              totalPrice: args.totalPrice,
              products: args.products,
            ),
            if (Platform.isIOS) verticalSpace(8.0),
          ],
        ),
      ),
    );
  }
}
