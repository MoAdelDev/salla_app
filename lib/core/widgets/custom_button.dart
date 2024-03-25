import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (!isTapped) {
            setState(() {
              isTapped = true;
            });
            await Future.delayed(const Duration(milliseconds: 160));

            widget.onPressed();

            setState(() {
              isTapped = false;
            });
          }
        },
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
            widget.text,
            style: AppTexts.text20WhiteLatoBold,
          ),
        ),
      ),
    );
  }
}
