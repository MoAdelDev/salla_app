import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 3 / 4,
      child: Text(
        'Welcome back! Glad to see you, Again!',
        style: AppTexts.text22BlackLatoBold,
      ),
    );
  }
}
