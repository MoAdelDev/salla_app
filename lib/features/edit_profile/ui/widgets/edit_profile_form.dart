import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: context.read<EditProfileCubit>().nameController,
            hintText: S.of(context).nameHintTitle,
            errorMsg: S.of(context).nameHintTitle,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<EditProfileCubit>().emailController,
            hintText: S.of(context).emailHintTitle,
            errorMsg: S.of(context).emailHintTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: context.read<EditProfileCubit>().phoneController,
            hintText: S.of(context).phoneHintTitle,
            errorMsg: S.of(context).phoneHintTitle,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
