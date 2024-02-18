import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Iphone 12',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTexts.text16BlackLatoBold,
    );
  }
}
