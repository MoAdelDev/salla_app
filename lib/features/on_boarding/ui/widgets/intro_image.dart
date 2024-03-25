import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class IntroImage extends StatefulWidget {
  const IntroImage({super.key});

  @override
  State<IntroImage> createState() => _IntroImageState();
}

class _IntroImageState extends State<IntroImage> {
  Offset imageOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/intro.json',
      animate: true,
      height: 300.h,
      width: 300.w,
    );
  }
}
