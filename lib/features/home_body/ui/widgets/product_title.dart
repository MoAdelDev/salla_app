import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTexts.text16BlackLatoBold,
    );
  }
}
