import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomNoProducts extends StatelessWidget {
  final String text;
  const CustomNoProducts({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppTexts.text16BlackLatoBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
