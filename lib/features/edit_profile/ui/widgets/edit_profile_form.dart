import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditProfileCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: context.read<EditProfileCubit>().nameController,
            hintText: context.locale.nameHintTitle,
            errorMsg: context.locale.nameHintTitle,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<EditProfileCubit>().emailController,
            hintText: context.locale.emailHintTitle,
            errorMsg: context.locale.emailHintTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<EditProfileCubit>().phoneController,
            hintText: context.locale.phoneHintTitle,
            errorMsg: context.locale.phoneHintTitle,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
