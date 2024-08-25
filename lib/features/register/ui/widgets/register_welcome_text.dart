import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class RegisterWelcomeText extends StatelessWidget {
  const RegisterWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Text(
        context.locale.registerMessage,
        style: AppTexts.text22BlackLatoBold,
      ),
    );
  }
}
