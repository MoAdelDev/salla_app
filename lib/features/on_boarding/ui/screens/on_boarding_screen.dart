import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      S.of(context).appTitle1,
      S.of(context).appTitle2,
      S.of(context).appTitle3,
    ];

    final List<String> subtitles = [
      S.of(context).appDescription1,
      S.of(context).appDescription2,
      S.of(context).appDescription3,
    ];
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAppBar(
                firstTap: () => context.pop(),
                firstWidegt: Icon(
                  Icons.chevron_left,
                  size: 30.0,
                  color: context.colorScheme.onBackground,
                ),
                secondTap: () => context.push(Routes.login),
                secondWidget: Icon(
                  Icons.skip_next,
                  size: 30.0,
                  color: context.colorScheme.onBackground,
                ),
              ),
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index, realIndex) {
                    return Column(children: [
                      Image.asset(
                        'assets/images/onboarding${index + 1}.jpg',
                        width: 300.0.h,
                        height: 300.0.h,
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
                    ]);
                  },
                  carouselController: carouselController,
                  options: CarouselOptions(
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
                        activeDotColor: AppColorLight.primaryColor,
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
                    backgroundColor: AppColorLight.primaryColor,
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
