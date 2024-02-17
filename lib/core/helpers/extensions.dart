import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
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
