import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/font_weight.dart';

class AppTexts {
  static TextStyle get text60WhiteLatoBold => GoogleFonts.lato(
        fontSize: 60.0,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14WhiteLatoRegular => GoogleFonts.lato(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text14WhiteLatoBold => GoogleFonts.lato(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text14WhiteCairoBold => GoogleFonts.cairo(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text14BlueCairoBold => GoogleFonts.cairo(
        fontSize: 14.0,
        color: AppColor.primaryColor,
        fontWeight: AppFontWeight.extraBold,
      );

  static TextStyle get text20WhiteLatoBold => GoogleFonts.lato(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16WhiteLatoBold => GoogleFonts.lato(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14GreyCairoExtraBold => GoogleFonts.cairo(
        fontSize: 14.0,
        color: Colors.grey,
        fontWeight: AppFontWeight.extraBold,
      );

  static TextStyle get text14BlackCairoBold => GoogleFonts.cairo(
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16BlackLatoBold => GoogleFonts.lato(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16BlackCairoBold => GoogleFonts.cairo(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text18BlackCairoBold => GoogleFonts.cairo(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text16BlackCairoRegular => GoogleFonts.cairo(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text14BlackCairoSemiBold => GoogleFonts.cairo(
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: AppFontWeight.semiBold,
      );

  static TextStyle get text18BlackLatoBold => GoogleFonts.lato(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14BlackLatoRegular => GoogleFonts.lato(
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text12BlackLatoRegular => GoogleFonts.lato(
        fontSize: 12.0,
        color: Colors.black,
        fontWeight: AppFontWeight.regular,
      );

  static TextStyle get text18primaryLatoBold => GoogleFonts.lato(
        fontSize: 18.0,
        color: AppColor.primaryColor,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text22BlackLatoBold => GoogleFonts.lato(
        fontSize: 22.0,
        color: Colors.black,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text22GreyLatoBold => GoogleFonts.lato(
        fontSize: 22.0,
        color: Colors.grey,
        fontWeight: AppFontWeight.bold,
      );

  static TextStyle get text14GreyLatoBold => GoogleFonts.lato(
        fontSize: 12.0,
        color: Colors.grey,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text22BlackLatoNormal => GoogleFonts.lato(
        fontSize: 16.0,
        color: Colors.black.withOpacity(0.7),
        fontWeight: AppFontWeight.regular,
      );
  static TextStyle get text16PrimaryLatoBold => GoogleFonts.lato(
        fontSize: 16.0,
        color: AppColor.primaryColor,
        fontWeight: AppFontWeight.bold,
      );
  static TextStyle get text28BlackShadowLatoBold => GoogleFonts.lato(
        fontSize: 28.0,
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
