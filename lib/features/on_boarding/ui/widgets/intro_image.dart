import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroImage extends StatefulWidget {
  const IntroImage({super.key});

  @override
  State<IntroImage> createState() => _IntroImageState();
}

class _IntroImageState extends State<IntroImage> {
  Offset imageOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
        imageOffset.dx,
        0,
        0,
      )..rotateZ((imageOffset.dx / 20) * 3.14 / 70),
      child: GestureDetector(
        onPanUpdate: (details) {
          if (imageOffset.dx.abs() <= 120) {
            setState(() {
              imageOffset = Offset(imageOffset.dx + details.delta.dx, 0);
            });
          }
        },
        onPanEnd: (_) {
          setState(() {
            imageOffset = Offset.zero;
          });
        },
        child: SizedBox(
          child: Image.asset(
            'assets/images/intro.png',
            width: 250.0.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
