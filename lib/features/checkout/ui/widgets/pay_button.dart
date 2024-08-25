import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

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
              cubit.emitStripeState(totalPrice);
            }
            if (cubit.payemntSelected == 1) {
              cubit.emitPayPalState(
                totalPrice: totalPrice,
                products: products,
                context: context,
              );
            }
            if (cubit.payemntSelected == 0) {
              cubit.emitPaymobState(
                totalPrice,
                products,
              );
            }
          },
          text: context.locale.pay,
        );
      },
    );
  }
}
