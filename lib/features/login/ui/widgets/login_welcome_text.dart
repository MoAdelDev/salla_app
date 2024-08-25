import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      child: Text(
        context.locale.loginMessage,
        style: AppTexts.text22BlackLatoBold,
      ),
    );
  }
}
