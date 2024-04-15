import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;

    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          if (!isTapped) {
            setState(() {
              isTapped = true;
            });
            await Future.delayed(const Duration(milliseconds: 160));
            if (!widget.isLoading) {
              widget.onPressed();
            }
            setState(() {
              isTapped = false;
            });
          }
        },
        color: context.colorScheme.primary,
        splashColor: context.colorScheme.primary,
        highlightColor: context.colorScheme.primary,
        disabledElevation: 0.0,
        disabledColor: context.colorScheme.primary,
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: AppTexts.text20WhiteLatoBold,
              ),
              if (widget.isLoading) ...[
                horizontalSpace(5.0),
                const CustomLoadingIndicator(
                  size: 30.0,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
