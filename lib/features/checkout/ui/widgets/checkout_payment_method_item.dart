import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';

class CheckoutPaymentMethodItem extends StatelessWidget {
  final Function(int?) onChanged;
  final int radioSelected;
  final int radioValue;
  final String title;
  final String subtitle;
  final IconData icon;
  const CheckoutPaymentMethodItem({
    super.key,
    required this.onChanged,
    required this.radioSelected,
    required this.radioValue,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(
          value: radioValue,
          groupValue: radioSelected,
          onChanged: onChanged,
          activeColor: AppColor.onPrimaryColor,
          fillColor: MaterialStateProperty.all(AppColor.onPrimaryColor),
        ),
        Icon(
          icon,
          size: 35,
          color: AppColor.onPrimaryColor,
        ),
        horizontalSpace(10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTexts.text16WhiteLatoBold,
              ),
              Text(
                subtitle,
                style: AppTexts.text14WhiteLatoRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
