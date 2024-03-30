import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomButton(
          onPressed: () {},
          text: 'Edit Profile',
        );
      },
    );
  }
}
