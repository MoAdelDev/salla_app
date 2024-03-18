import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class RegisterWelcomeText extends StatelessWidget {
  const RegisterWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Text(
        S.of(context).registerMessage,
        style: AppTexts.text22BlackLatoBold,
      ),
    );
  }
}
