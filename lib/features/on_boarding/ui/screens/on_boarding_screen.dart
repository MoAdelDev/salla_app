import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SKIP',
              style: AppTexts.text16PrimaryLatoBold,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(),
        ),
      ),
    );
  }
}
