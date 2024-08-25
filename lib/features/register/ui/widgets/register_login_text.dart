import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';

class RegisterLoginText extends StatelessWidget {
  const RegisterLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.locale.loginQuestion,
          style: AppTexts.text14BlackLatoRegular,
        ),
        horizontalSpace(5.0),
        CustomTextButton(
          onPressed: () => context.pushReplacement(Routes.login),
          text: context.locale.loginTitle,
        ),
      ],
    );
  }
}
