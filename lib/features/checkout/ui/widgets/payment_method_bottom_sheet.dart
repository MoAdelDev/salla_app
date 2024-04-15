import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/pay_button.dart';
import 'package:salla_app/features/checkout/ui/widgets/payment_item.dart';
import 'package:salla_app/generated/l10n.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  final double totalPrice;
  final List<CartProductModel> products;
  const PaymentMethodBottomSheet(
      {super.key, required this.totalPrice, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        return SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
              vertical: 10.0.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 100.0.w,
                    height: 10.0.h,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                verticalSpace(16.0),
                Text(
                  S.of(context).selectPaymentMethod,
                  style: AppTexts.text18BlackCairoBold,
                ),
                verticalSpace(16.0),
                Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: CustomInkwell(
                        onTap: () => cubit.emitSelectPaymentMethodState(index),
                        child: PaymentItem(
                          image: cubit.paymentImages[index],
                          isSelected: index == cubit.payemntSelected,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(16.0),
                PayButton(
                  totalPrice: totalPrice,
                  products: products,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
