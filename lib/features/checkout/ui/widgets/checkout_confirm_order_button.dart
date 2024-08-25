import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/payment_method_bottom_sheet.dart';

class CheckoutConfirmOrderButton extends StatelessWidget {
  final double totalPrice;
  final List<CartProductModel> products;
  const CheckoutConfirmOrderButton({
    super.key,
    required this.totalPrice,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          addOrderSuccess: (message) {
            showToast(message);
            context.pushAndRemoveUntil(Routes.home);
          },
          failure: (message) {
            showToast(message, isError: true);
          },
        );
      },
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            right: 15.0.w,
            left: 15.0.w,
            top: 5.0.h,
            bottom: 10.0.h,
          ),
          child: CustomButton(
            onPressed: () => cubit.paymentMethodSelected == 1
                ? context.read<CheckoutCubit>().emitAddOrderState()
                : {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      builder: (_) {
                        return BlocProvider.value(
                          value: cubit,
                          child: PaymentMethodBottomSheet(
                            totalPrice: totalPrice,
                            products: products,
                          ),
                        );
                      },
                    ),
                  },
            text: context.locale.confirmOrderTitle,
            isLoading: state is AddOrderLoading,
          ),
        );
      },
    );
  }
}
