import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_product_item.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutProducts extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  const CheckoutProducts({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CheckoutCart(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).productsTitle,
                    style: AppTexts.text16WhiteLatoBold,
                  ),
                ],
              ),
              verticalSpace(5.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = cartProducts[index];
                  return CheckoutProductItem(
                    cartProduct: product,
                  );
                },
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => verticalSpace(10.0),
                itemCount: cartProducts.length,
              ),
            ],
          ),
        ),
        Positioned(
          right: AppData.isArabic ? null : 20.w,
          left: AppData.isArabic ? 20.w : null,
          top: -4.h,
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 5.0.h,
              ),
              child: Text(
                S.of(context).modifyCartTitle,
                style: AppTexts.text14WhiteLatoBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
