import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/profile/logic/cubit/profile_cubit.dart';

class ProfileEditProfileButton extends StatelessWidget {
  const ProfileEditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: () {
        context.push(Routes.editProfile).then((value) {
          if (context.mounted) context.read<ProfileCubit>().emitUserDataState();
        });
      },
      child: Icon(
        Icons.edit,
        color: context.colorScheme.primary,
        size: 28,
      ),
    );
  }
}
