import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class CartName extends StatelessWidget {
  final String name;
  const CartName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTexts.text18BlackLatoBold,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
