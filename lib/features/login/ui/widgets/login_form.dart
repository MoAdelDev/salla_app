import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
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
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: context.read<LoginCubit>().emailController,
            hintText: S.of(context).emailHintTitle,
            errorMsg: S.of(context).emailTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<LoginCubit>().passwordController,
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
            onSubmit: (value) => context.read<LoginCubit>().emitLoginState(),
          ),
        ],
      ),
    );
  }
}
