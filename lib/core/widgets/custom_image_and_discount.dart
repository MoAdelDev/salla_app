import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_discount_container.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class CustomImageAndDiscount extends StatelessWidget {
  final String image;
  final int discount;
  const CustomImageAndDiscount({
    super.key,
    required this.image,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      margin: EdgeInsets.only(
        top: 10.0.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: image,
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
          if (discount != 0)
            Positioned(
              left: 0,
              right: 0,
              child: CustomDiscountContainer(discount: discount),
            ),
        ],
      ),
    );
  }
}
