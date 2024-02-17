import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';

class LoginRegisterText extends StatelessWidget {
  const LoginRegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTexts.text14BlackLatoRegular,
        ),
        horizontalSpace(5.0),
        CustomTextButton(
          onPressed: () {},
          text: 'Register',
        )
      ],
    );
  }
}
