import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData lightTheme(context) => ThemeData(
      colorScheme: ColorScheme(
        primary: AppColor.primaryColor,
        primaryContainer: AppColor.primaryVariantColor,
        background: AppColor.backgroundColor,
        secondary: AppColor.secondaryColor,
        secondaryContainer: AppColor.secondaryVariantColor,
        error: AppColor.errorColor,
        surface: AppColor.surfaceColor,
        onSurface: AppColor.onSurfaceColor,
        onPrimary: AppColor.onPrimaryColor,
        onSecondary: AppColor.onSecondaryColor,
        onError: AppColor.onErrorColor,
        onBackground: AppColor.onBackgroundColor,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: GoogleFonts.lato(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColor.onBackgroundColor,
        ),
        titleSpacing: 10.0,
      ),
      scaffoldBackgroundColor: AppColor.lightGreyColor,
      useMaterial3: true,
    );
