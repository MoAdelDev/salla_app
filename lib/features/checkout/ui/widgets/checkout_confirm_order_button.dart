import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutConfirmOrderButton extends StatelessWidget {
  const CheckoutConfirmOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(addOrderSuccess: (message) {
          showToast(message);
          context.pushAndRemoveUntil(Routes.home);
        }, addOrderFailure: (message) {
          showToast(message, isError: true);
        });
      },
      builder: (context, state) {
        if (state is AddOrderLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            right: 15.0.w,
            left: 15.0.w,
            top: 5.0.h,
            bottom: 10.0.h,
          ),
          child: CustomButton(
            onPressed: () => context.read<CheckoutCubit>().emitAddOrderState(),
            text: 'Confirm Order',
          ),
        );
      },
    );
  }
}
