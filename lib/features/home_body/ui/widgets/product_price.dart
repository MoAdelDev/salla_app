import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class ProductPrice extends StatelessWidget {
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  const ProductPrice(
      {super.key,
      required this.price,
      required this.oldPrice,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$price EGP',
          style: AppTexts.text14BlackCairoBold,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (discount != 0)
          Expanded(
            child: Text(
              '$oldPrice EGP',
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
