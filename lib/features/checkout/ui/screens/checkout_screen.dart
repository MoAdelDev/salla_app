import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_addresses.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_confirm_order_button.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_methods.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_products.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_summary.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_title.dart';
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckoutTitle(
                      text: S.of(context).orderSummaryTitle,
                    ),
                    CheckoutSummary(
                      totalPrice: args.totalPrice,
                      totalItems: args.totalItems,
                    ),
                    CheckoutTitle(
                      text: S.of(context).paymentMethodTitle,
                    ),
                    const CheckoutPaymentMethods(),
                    CheckoutTitle(
                      text: S.of(context).myAddressesTitle,
                      onTap: () => context.push(Routes.addAddress).then(
                        (value) {
                          context.read<CheckoutCubit>().emitAddressesState();
                        },
                      ),
                      textButton: S.of(context).add,
                    ),
                    const CheckoutAddresses(),
                    CheckoutTitle(
                      text: S.of(context).productsTitle,
                      onTap: () => context.pop(),
                      textButton: S.of(context).modifyCartTitle.toUpperCase(),
                    ),
                    CheckoutProducts(
                      cartProducts: args.products,
                    ),
                  ],
                ),
              ),
            ),
            CheckoutConfirmOrderButton(
              totalPrice: args.totalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
