import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        state.whenOrNull(success: (message) {
          showToast(message);
          context.pop();
        }, error: (message) {
          showToast(message, isError: true);
        });
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return CustomButton(
          onPressed: () =>
              context.read<EditProfileCubit>().emitEditProfileState(),
          text: 'Edit Profile',
        );
      },
    );
  }
}
