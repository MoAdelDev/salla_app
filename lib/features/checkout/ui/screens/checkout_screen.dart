import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_address.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payemnt_methods.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_summary.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_title.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    const CheckoutPayemntMethods(),
                    CheckoutTitle(
                      text: S.of(context).myAddressesTitle,
                    ),
                    const CheckoutAddress(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
