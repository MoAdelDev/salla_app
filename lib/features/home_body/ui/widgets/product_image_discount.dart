import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_discount_container.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductImageDiscount extends StatelessWidget {
  final ProductModel productModel;
  const ProductImageDiscount({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CachedNetworkImage(
            imageUrl: productModel.image,
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
          if (productModel.discount != 0)
            CustomDiscountContainer(discount: productModel.discount),
        ],
      ),
    );
  }
}
