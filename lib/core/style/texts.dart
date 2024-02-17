import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/core/style/colors.dart';

class AppTexts {
  static TextStyle get text60WhiteLatoBold => GoogleFonts.lato(
        fontSize: 60.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get text14WhiteLatoNormal => GoogleFonts.lato(
        fontSize: 14.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get text20WhiteLatoBold => GoogleFonts.lato(
        fontSize: 20.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get text14BlackLatoBold => GoogleFonts.lato(
        fontSize: 14.0.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get text18primaryLatoBold => GoogleFonts.lato(
        fontSize: 18.0.sp,
        color: AppColorLight.primaryColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get text22BlackLatoBold => GoogleFonts.lato(
        fontSize: 22.0.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get text22BlackLatoNormal => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.normal,
      );
  static TextStyle get text16PrimaryLatoBold => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: AppColorLight.primaryColor,
        fontWeight: FontWeight.bold,
      );
}
