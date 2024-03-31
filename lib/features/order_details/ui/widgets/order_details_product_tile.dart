import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';

class OrderDetailsProductTile extends StatelessWidget {
  final OrderDetailsProductModel product;
  const OrderDetailsProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        Routes.productDetails,
        arguments: ProductDetailsScreenArgs(productId: product.id),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.image,
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
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTexts.text16WhiteLatoBold,
                ),
                verticalSpace(5.0),
                Row(
                  children: [
                    Text(
                      'Quantity -> ${product.quantity}',
                      style: AppTexts.text14WhiteLatoRegular,
                    ),
                    const Spacer(),
                    Text(
                      '${product.price} EGP',
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
