import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: AppTexts.text14WhiteLatoRegular,
          ),
        ),
      ],
    );
  }
}
