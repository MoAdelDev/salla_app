import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'EGP ${2000}',
          style: AppTexts.text14BlackLatoBold,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (true)
          Expanded(
            child: Text(
              '${1000}',
              overflow: TextOverflow.ellipsis,
              style: AppTexts.text14GreyLatoBold.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
      ],
    );
  }
}
