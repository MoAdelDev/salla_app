import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  final VoidCallback? onSuffixIcon;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final bool? obscureText;
  final String errorMsg;
  final TextInputType keyboardType;
  final bool? isNextTabEnable;
  final TextInputAction textInputAction;
  final Function()? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    required this.errorMsg,
    required this.keyboardType,
    this.isNextTabEnable = true,
    this.onSuffixIcon,
    this.suffixIcon,
    this.onChange,
    this.onSubmit,
    required this.textInputAction,
    this.prefixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      cursorColor: Theme.of(context).colorScheme.primary,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIconColor:
            WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.focused)) {
            return context.colorScheme.primary;
          }
          if (states.contains(WidgetState.error)) {
            return context.colorScheme.error;
          }
          return context.colorScheme.outlineVariant;
        }),
        suffixIconColor:
            WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.focused)) {
            return context.colorScheme.primary;
          }
          if (states.contains(WidgetState.error)) {
            return context.colorScheme.error;
          }
          return context.colorScheme.outlineVariant;
        }),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        hintText: hintText,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[600]!,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIcon,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 1,
      textAlign: TextAlign.start,
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMsg;
        }
        return null;
      },
      onChanged: onChange,
    );
  }
}
