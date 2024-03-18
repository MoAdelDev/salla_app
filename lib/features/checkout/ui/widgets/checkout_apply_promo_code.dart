import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';

class CheckoutApplyPromoCode extends StatelessWidget {
  const CheckoutApplyPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {},
      text: 'Apply',
      textStyle: AppTexts.text16WhiteLatoBold,
    );
  }
}
