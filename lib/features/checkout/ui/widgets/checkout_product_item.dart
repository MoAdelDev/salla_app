import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

class CheckoutProductItem extends StatelessWidget {
  final CartProductModel cartProduct;
  const CheckoutProductItem({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(productId: cartProduct.product.id),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartProduct.product.image,
            width: 70.0.w,
            height: 70.0.h,
            errorListener: (value) => const CustomShimmer(),
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  const CustomShimmer(),
                  Text(
                    '${downloadProgress.progress}%',
                    style: AppTexts.text14BlackLatoBold,
                  ),
                ],
              );
            },
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0.r),
                  image: DecorationImage(
                    image: imageProvider,
                  ),
                ),
              );
            },
          ),
          horizontalSpace(8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProduct.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTexts.text16WhiteLatoBold,
                ),
                verticalSpace(5.0),
                Row(
                  children: [
                    Text(
                      'Quantity -> ${cartProduct.quantity}',
                      style: AppTexts.text14WhiteLatoRegular,
                    ),
                    const Spacer(),
                    Text(
                      '${cartProduct.product.price} EGP',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTexts.text14WhiteLatoBold,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
