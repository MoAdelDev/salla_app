import 'package:flutter/material.dart';

extension NavigationEx on BuildContext {
  void push(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
        this, routeName, arguments: arguments, (route) => false);
  }

  void pushReplacement(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }
}

extension ThemeEx on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension RegEx on String {
  bool isNumber() {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(this);
  }
}
