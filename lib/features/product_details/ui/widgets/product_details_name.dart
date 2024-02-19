import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductDetailsName extends StatelessWidget {
  final String name;
  const ProductDetailsName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTexts.text16BlackLatoBold,
      overflow: TextOverflow.visible,
    );
  }
}
