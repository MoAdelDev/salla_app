import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class CheckoutAddressItem extends StatelessWidget {
  final Function(int?) onChanged;
  final int value;
  final int radioSelected;
  final AddressModel address;
  const CheckoutAddressItem({
    super.key,
    required this.onChanged,
    required this.value,
    required this.radioSelected,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: radioSelected,
          onChanged: onChanged,
          activeColor: AppColor.onPrimaryColor,
          fillColor: MaterialStateProperty.all(AppColor.onPrimaryColor),
        ),
        horizontalSpace(5.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.name,
                style: AppTexts.text16WhiteLatoBold,
              ),
              Text(
                '${address.city}, ${address.region}, ${address.details}',
                style: AppTexts.text14WhiteLatoRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
