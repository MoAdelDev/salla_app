import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: CustomButton(
        onPressed: () {},
        text: S.of(context).loginTitle,
      ),
    );
  }
}
