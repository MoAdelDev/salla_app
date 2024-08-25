import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final cs.CarouselSliderController carouselController =
      cs.CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.locale.appTitle1,
      context.locale.appTitle2,
      context.locale.appTitle3,
    ];

    final List<String> subtitles = [
      context.locale.appDescription1,
      context.locale.appDescription2,
      context.locale.appDescription3,
    ];
    final List<String> images = [
      'assets/images/onboarding1.jpg',
      'assets/images/onboarding2.jpg',
      'assets/images/onboarding3.jpg',
    ];
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0.w,
            vertical: 20.0.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAppBar(
                onTap2: () => context.push(Routes.login),
                icon2: AppData.isArabic ? Icons.skip_previous : Icons.skip_next,
              ),
              Expanded(
                child: cs.CarouselSlider.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        Image.asset(
                          images[index],
                          height: 300.h,
                          width: 300.w,
                        ),
                        verticalSpace(10.0),
                        Text(
                          titles[index],
                          style: AppTexts.text22BlackLatoBold,
                        ),
                        verticalSpace(10.0),
                        Text(
                          subtitles[index],
                          style: AppTexts.text22BlackLatoNormal,
                        )
                      ],
                    );
                  },
                  carouselController: carouselController,
                  options: cs.CarouselOptions(
                    height: 400.h,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: titles.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColor.primaryColor,
                        expansionFactor: 3,
                        spacing: 10.0,
                      ),
                      onDotClicked: (index) {
                        setState(() {
                          currentIndex = index;
                          carouselController.animateToPage(index);
                        });
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 35.0,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: IconButton(
                        onPressed: () {
                          if (currentIndex < titles.length - 1) {
                            setState(() {
                              currentIndex++;
                              carouselController.animateToPage(currentIndex);
                            });
                          } else {
                            context.push(Routes.login);
                          }
                        },
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
