import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_apply_promo_code.dart';

class CheckoutSummary extends StatelessWidget {
  final double totalPrice;
  final int totalItems;
  const CheckoutSummary({
    super.key,
    required this.totalPrice,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.orderSummaryTitle,
            style: AppTexts.text16BlackCairoBold,
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Text(
                '${context.locale.itemTotalTitle} ( $totalItems )',
                style: AppTexts.text14BlackLatoRegular,
              ),
              const Spacer(),
              Text(
                '$totalPrice EGP',
                style: AppTexts.text16BlackLatoBold,
              ),
            ],
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Text(
                context.locale.deliveryFeesTitle,
                style: AppTexts.text14BlackLatoRegular,
              ),
              const Spacer(),
              Text(
                context.locale.freeTitle,
                style: AppTexts.text16BlackLatoBold,
              )
            ],
          ),
          verticalSpace(5.0),
          const Divider(
            color: Colors.white,
            height: 1.0,
            thickness: 0.5,
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Text(
                context.locale.totalTitle,
                style: AppTexts.text16BlackLatoBold,
              ),
              const Spacer(),
              Text(
                '$totalPrice EGP',
                style: AppTexts.text16BlackLatoBold,
              )
            ],
          ),
          verticalSpace(5.0),
          const Divider(
            color: Colors.grey,
            height: 1.0,
            thickness: 0.5,
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: context.read<CheckoutCubit>().promoCodeController,
                  hintText: 'Enter Promo Code',
                  errorMsg: 'Please enter promo code',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onSubmit: (value) {
                    context.read<CheckoutCubit>().emitPromoCodeState();
                  },
                ),
              ),
              horizontalSpace(3.0),
              const CheckoutApplyPromoCode(),
            ],
          )
        ],
      ),
    );
  }
}
