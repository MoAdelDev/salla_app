import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductDetailsPrice extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 2.0.h,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EGP ${product.price}',
            style: AppTexts.text16BlackLatoBold,
          ),
          horizontalSpace(5.0),
          if (product.discount != 0)
            Text(
              'EGP ${product.oldPrice}',
              style: AppTexts.text14GreyLatoBold.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    );
  }
}
