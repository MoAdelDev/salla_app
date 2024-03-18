import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        foregroundColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: AppTexts.text20WhiteLatoBold,
        ),
      ),
    );
  }
}
