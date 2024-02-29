import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

class CartQuantity extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartQuantity({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colorScheme.primary,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6.0.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
            ),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.remove,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            decoration: BoxDecoration(
              color: context.colorScheme.onPrimary,
            ),
            child: Center(child: Text('${cartProduct.quantity}')),
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6.0.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
            ),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.add,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
