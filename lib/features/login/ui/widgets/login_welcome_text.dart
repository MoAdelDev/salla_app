import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 3 / 4,
      child: Text(
        S.of(context).loginMessage,
        style: AppTexts.text22BlackLatoBold,
      ),
    );
  }
}
