import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductName extends StatelessWidget {
  final String name;
  const ProductName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTexts.text16WhiteLatoBold,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
