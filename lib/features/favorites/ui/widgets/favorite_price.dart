import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class FavoritePrice extends StatelessWidget {
  const FavoritePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'EGP ${2000}',
          style: AppTexts.text14BlackLatoBold,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (true)
          Text(
            'EGP ${1000}',
            style: AppTexts.text14GreyLatoBold.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
