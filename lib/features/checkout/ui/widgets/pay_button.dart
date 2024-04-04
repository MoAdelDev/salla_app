import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/checkout/data/models/paypal_transaction_model.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/generated/l10n.dart';

class PayButton extends StatelessWidget {
  final List<CartProductModel> products;
  final double totalPrice;
  const PayButton(
      {super.key, required this.totalPrice, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        if (state is AddOrderLoading) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 5.0.h,
                bottom: 10.0.h,
              ),
              child: const CustomLoadingIndicator(),
            ),
          );
        }
        return CustomButton(
          onPressed: () {
            if (cubit.payemntSelected == 2) {
              cubit.emitPaymentState(totalPrice);
            }
            if (cubit.payemntSelected == 1) {
              AmountDetailsModel amountDetails = AmountDetailsModel(
                '${(totalPrice / 50).round()}',
                '0',
                '0',
              );
              AmountModel amount = AmountModel(
                '${(totalPrice / 50).round()}',
                'USD',
                amountDetails,
              );
              AddressModel addressModel = cubit.addresses!.singleWhere(
                  (element) => element.id == cubit.addressSelectedId);

              PayPalShipphingAddress shipphingAddress = PayPalShipphingAddress(
                addressModel.name,
                addressModel.details,
                '',
                addressModel.city,
                '',
                AppData.userModel.phone,
                'EG',
                addressModel.region,
              );

              List<PayPalOrderModel> items = products
                  .map(
                    (e) => PayPalOrderModel(
                      e.product.name,
                      e.quantity.toString(),
                      '${(e.product.price / 50 as double).round()}',
                      'USD',
                    ),
                  )
                  .toList();
              PayPalItems payPalItems = PayPalItems(
                items,
                shipphingAddress,
              );
              PayPalTransactionModel transaction = PayPalTransactionModel(
                'Pay via PayPal Checkout',
                payPalItems,
                amount,
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: dotenv.env['PAYPAL_CLIENT_ID'],
                    secretKey: dotenv.env['PAYPAL_SECRET_KEY'],
                    transactions: [
                      transaction.toJson(),
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      cubit.emitAddOrderState();
                      context.pop();
                    },
                    onError: (error) {
                      log("onError: $error");
                      context.pop();
                      showToast(error.toString());
                    },
                    onCancel: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            }
            if (cubit.payemntSelected == 0) {
              cubit.emitPaymobState(
                totalPrice,
                products,
              );
            }
          },
          text: S.of(context).pay,
        );
      },
    );
  }
}
