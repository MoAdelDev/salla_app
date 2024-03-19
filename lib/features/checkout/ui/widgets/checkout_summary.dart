import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_apply_promo_code.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${S.of(context).itemTotalTitle} ( 2 )',
                style: AppTexts.text14WhiteLatoRegular,
              ),
              const Spacer(),
              Text(
                '200 EGP',
                style: AppTexts.text16WhiteLatoBold,
              ),
            ],
          ),
          verticalSpace(5.0),
          Row(
            children: [
              Text(
                S.of(context).deliveryFeesTitle,
                style: AppTexts.text14WhiteLatoRegular,
              ),
              const Spacer(),
              Text(
                S.of(context).freeTitle,
                style: AppTexts.text16WhiteLatoBold,
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
                S.of(context).totalTitle,
                style: AppTexts.text16WhiteLatoBold,
              ),
              const Spacer(),
              Text(
                '200 EGP',
                style: AppTexts.text16WhiteLatoBold,
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
              Expanded(
                child: CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Enter Promo Code',
                  errorMsg: 'Please enter promo code',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
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