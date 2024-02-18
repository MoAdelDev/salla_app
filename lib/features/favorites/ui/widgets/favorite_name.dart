import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class FavoriteName extends StatelessWidget {
  const FavoriteName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Iphone 12',
      style: AppTexts.text18BlackLatoBold,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
