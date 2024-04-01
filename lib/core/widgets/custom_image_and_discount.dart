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
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          width: 80.0.w,
          height: 80.0.h,
          placeholder: (context, url) => const CustomShimmer(),
          errorWidget: (context, url, error) => const CustomShimmer(),
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
          SizedBox(
            width: 80.0.w,
            child: CustomDiscountContainer(
              discount: discount,
            ),
          ),
      ],
    );
  }
}
