import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ProductDetailsImageAndDiscount extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsImageAndDiscount({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double imageHeight = 400.h;

    return Stack(
      children: [
        CarouselSlider(
          items: product.images
              .map(
                (e) => Container(
                  color: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: e,
                    placeholder: (context, url) => const CustomShimmer(),
                    errorWidget: (context, url, error) => const CustomShimmer(),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: imageHeight,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        if (product.discount != 0)
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                '- ${product.discount} %',
                style: AppTexts.text16WhiteLatoBold,
              ),
            ),
          ),
      ],
    );
  }
}
