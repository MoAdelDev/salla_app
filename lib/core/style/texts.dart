import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/font_weight.dart';

class AppTexts {
  static TextStyle get text60WhiteLatoBold => GoogleFonts.lato(
        fontSize: 60.0.sp,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14WhiteLatoRegular => GoogleFonts.lato(
        fontSize: 14.0.sp,
        color: Colors.white,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text20WhiteLatoBold => GoogleFonts.lato(
        fontSize: 20.0.sp,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16WhiteLatoBold => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14BlackLatoBold => GoogleFonts.lato(
        fontSize: 14.0.sp,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16BlackLatoBold => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14BlackLatoRegular => GoogleFonts.lato(
        fontSize: 14.0.sp,
        color: Colors.black,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text18primaryLatoBold => GoogleFonts.lato(
        fontSize: 18.0.sp,
        color: AppColorLight.primaryColor,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text22BlackLatoBold => GoogleFonts.lato(
        fontSize: 22.0.sp,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text22GreyLatoBold => GoogleFonts.lato(
        fontSize: 22.0.sp,
        color: Colors.grey,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14GreyLatoBold => GoogleFonts.lato(
        fontSize: 12.0.sp,
        color: Colors.grey,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text22BlackLatoNormal => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: Colors.black.withOpacity(0.7),
        fontWeight: AppFontWeight.regular,
      );
  static TextStyle get text16PrimaryLatoBold => GoogleFonts.lato(
        fontSize: 16.0.sp,
        color: AppColorLight.primaryColor,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text28BlackShadowLatoBold => GoogleFonts.lato(
        fontSize: 28.0.sp,
        color: Colors.black,
        shadows: [
          const Shadow(
            color: Colors.black,
            blurRadius: 1.0,
          )
        ],
        fontWeight: AppFontWeight.bold,
      );
}
