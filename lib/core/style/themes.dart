import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData lightTheme(context) => ThemeData(
      colorScheme: ColorScheme(
        primary: AppColorLight.primaryColor,
        primaryContainer: AppColorLight.primaryVariantColor,
        background: AppColorLight.backgroundColor,
        secondary: AppColorLight.secondaryColor,
        secondaryContainer: AppColorLight.secondaryVariantColor,
        error: AppColorLight.errorColor,
        surface: AppColorLight.surfaceColor,
        onSurface: AppColorLight.onSurfaceColor,
        onPrimary: AppColorLight.onPrimaryColor,
        onSecondary: AppColorLight.onSecondaryColor,
        onError: AppColorLight.onErrorColor,
        onBackground: AppColorLight.onBackgroundColor,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorLight.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorLight.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: GoogleFonts.lato(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColorLight.onBackgroundColor,
        ),
        titleSpacing: 10.0,
      ),
    );
