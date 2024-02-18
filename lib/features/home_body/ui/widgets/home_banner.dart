import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) => CachedNetworkImage(
        imageUrl:
            "https://student.valuxapps.com/storage/uploads/banners/1689106904Mzsmc.photo_2023-07-11_23-08-24.png",
        placeholder: (context, url) => const CustomShimmer(),
        width: double.infinity,
        height: 200.0.h,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const CustomShimmer(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.r),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      options: CarouselOptions(
        height: 200.0.h,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
        pauseAutoPlayOnTouch: true,
        scrollPhysics: const BouncingScrollPhysics(),
        pauseAutoPlayOnManualNavigate: true,
        autoPlayInterval: const Duration(seconds: 7),
        pauseAutoPlayInFiniteScroll: true,
      ),
    );
  }
}
