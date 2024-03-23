import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_image_and_discount.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_name.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_price.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class SearchTile extends StatelessWidget {
  final ProductModel product;
  const SearchTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 14.0.w,
        vertical: 8.0.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomImageAndDiscount(
                image: product.image,
                discount: product.discount,
              ),
              horizontalSpace(5.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductName(name: product.name),
                      verticalSpace(8.0),
                      ProductPrice(product: product)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
