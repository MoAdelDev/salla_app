import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class AddToCartSubmit extends StatelessWidget {
  const AddToCartSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0.w,
      ),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          onPressed: () {},
          text: S.of(context).addToCartTitle,
        ),
      ),
    );
  }
}
