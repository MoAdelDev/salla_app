import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_discount_container.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';

class FavoriteImageDiscount extends StatelessWidget {
  final FavoriteProductModel product;
  const FavoriteImageDiscount({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: product.image,
          height: 100.h,
          width: 100.w,
          errorWidget: (context, url, error) => const CustomShimmer(),
          placeholder: (context, url) => const CustomShimmer(),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                onError: (exception, stackTrace) => const CustomShimmer(),
              ),
            ),
          ),
        ),
        if (product.discount != 0)
          Positioned(
            left: 0,
            right: 0,
            child: CustomDiscountContainer(discount: product.discount),
          ),
      ],
    );
  }
}
