import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutApplyPromoCode extends StatelessWidget {
  const CheckoutApplyPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(applyPromoCodeSuccess: (message) {
          showToast(message);
        }, applyPromoCodeFailure: (message) {
          showToast(message, isError: true);
        });
      },
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        if (cubit.isPromoCodeApplyLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return CustomTextButton(
          onPressed: () {
            if (state is! Loading) {
              cubit.emitPromoCodeState();
            } else {
              showToast('Please wait', isError: true);
            }
          },
          text: 'Apply',
          textStyle: AppTexts.text14BlueCairoBold,
        );
      },
    );
  }
}
