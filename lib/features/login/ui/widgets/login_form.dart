import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).emailHintTitle,
          errorMsg: 'Please enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        verticalSpace(10.0),
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).passwordHintTitle,
          errorMsg: 'Please enter your password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: isPasswordHidden,
          suffixIcon: isPasswordHidden
              ? CupertinoIcons.eye_solid
              : Icons.visibility_off,
          onSuffixIcon: () {
            setState(() {
              isPasswordHidden = !isPasswordHidden;
            });
          },
          onSubmit: (value) {},
        ),
      ],
    );
  }
}
