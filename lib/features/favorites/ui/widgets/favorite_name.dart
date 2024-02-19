import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class FavoriteName extends StatelessWidget {
  final String name;
  const FavoriteName({super.key, required this.name});

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
