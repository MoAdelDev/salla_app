import 'package:flutter/material.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorLight.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Salla',
              style: AppTexts.text60WhiteLatoBold,
            ),
          ),
          Center(
            child: Text(
              S.of(context).appTitle,
              style: AppTexts.text60WhiteLatoBold,
            ),
          ),
        ],
      ),
    );
  }
}
