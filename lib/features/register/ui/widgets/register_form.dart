import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/generated/l10n.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).nameHintTitle,
          errorMsg: S.of(context).nameTitle,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
        verticalSpace(10.0),
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).emailHintTitle,
          errorMsg: S.of(context).emailTitle,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        verticalSpace(10.0),
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).phoneHintTitle,
          errorMsg: S.of(context).phoneTitle,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        ),
        verticalSpace(10.0),
        CustomTextField(
          controller: TextEditingController(),
          hintText: S.of(context).passwordHintTitle,
          errorMsg: S.of(context).passwordTitle,
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
