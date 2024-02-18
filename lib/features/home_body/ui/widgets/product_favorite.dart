import 'package:flutter/material.dart';

class ProductFavorite extends StatelessWidget {
  const ProductFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // add to favorites
      },
      icon: Icon(
        // ignore: dead_code
        true ? Icons.favorite : Icons.favorite_border,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
