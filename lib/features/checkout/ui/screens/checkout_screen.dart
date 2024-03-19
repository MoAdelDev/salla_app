import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_addresses.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_confirm_order_button.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_methods.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_products.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_summary.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_title.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutScreen extends StatelessWidget {
  final CartData data;
  const CheckoutScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onTap1: () => context.pop(),
              icon1: Icons.chevron_left,
              title: 'Checkout',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckoutTitle(
                      text: S.of(context).orderSummaryTitle,
                    ),
                    const CheckoutSummary(),
                    CheckoutTitle(
                      text: S.of(context).paymentMethodTitle,
                    ),
                    const CheckoutPaymentMethods(),
                    CheckoutTitle(
                      text: S.of(context).myAddressesTitle,
                      onTap: () {},
                      textButton: S.of(context).changeTitle,
                    ),
                    const CheckoutAddresses(),
                    CheckoutTitle(
                      text: S.of(context).productsTitle,
                      onTap: () {},
                      textButton: S.of(context).modifyCartTitle.toUpperCase(),
                    ),
                    const CheckoutProducts(),
                  ],
                ),
              ),
            ),
            const CheckoutConfirmOrderButton(),
          ],
        ),
      ),
    );
  }
}
