import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )),
      child: Text(
        text,
        style: AppTexts.text16PrimaryLatoBold,
      ),
    );
  }
}
