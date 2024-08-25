import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/register/logic/cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: context.read<RegisterCubit>().nameController,
            hintText: context.locale.nameHintTitle,
            errorMsg: context.locale.nameHintTitle,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<RegisterCubit>().emailController,
            hintText: context.locale.emailHintTitle,
            errorMsg: context.locale.emailHintTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<RegisterCubit>().phoneController,
            hintText: context.locale.phoneHintTitle,
            errorMsg: context.locale.phoneHintTitle,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: context.locale.passwordHintTitle,
            errorMsg: context.locale.passwordHintTitle,
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
            onSubmit: (value) {
              context.read<RegisterCubit>().emitRegisterState();
            },
          ),
        ],
      ),
    );
  }
}
