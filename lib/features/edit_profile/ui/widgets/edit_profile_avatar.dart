import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';
import 'package:salla_app/features/profile/ui/widgets/user_avatar.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        EditProfileCubit cubit = context.read<EditProfileCubit>();
        return CustomInkwell(
          onTap: () => cubit.emitPickImageState(),
          child: Stack(
            children: [
              cubit.imageFile == null
                  ? UserAvatar(image: AppData.userModel.avatar ?? '')
                  : CircleAvatar(
                      radius: 52.0.r,
                      backgroundColor: context.colorScheme.primary,
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50.0.r,
                          backgroundColor: Colors.grey.shade400,
                          child: Image.file(
                            cubit.imageFile!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.camera_alt,
                  color: context.colorScheme.primary,
                  size: 30.0.r,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
