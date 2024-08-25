import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/home_body/data/models/banners_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        List<BannerModel> banners = context.read<HomeBodyCubit>().banners;
        if (banners.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 10.0.h,
              left: 20.0.w,
              right: 20.0.w,
            ),
            child: CustomShimmer(
              width: double.infinity,
              height: 140.0.h,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0.r),
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder: (context, index, realIndex) => CachedNetworkImage(
              imageUrl: banners[index].image,
              placeholder: (context, url) => const CustomShimmer(),
              width: double.infinity,
              height: 140.0.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const CustomShimmer(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              height: 140.0.h,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.80,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
              pauseAutoPlayOnTouch: true,
              scrollPhysics: const BouncingScrollPhysics(),
              pauseAutoPlayOnManualNavigate: true,
              autoPlayInterval: const Duration(seconds: 7),
              pauseAutoPlayInFiniteScroll: true,
            ),
          ),
        );
      },
    );
  }
}
