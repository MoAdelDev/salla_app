import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension SnackBarEx on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        content: SafeArea(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

extension NavigationEx on BuildContext {
  void push(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void pushReplacement(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }
}

extension ThemeEx on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
