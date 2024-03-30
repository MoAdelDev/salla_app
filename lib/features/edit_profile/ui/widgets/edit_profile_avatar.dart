import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_state.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<EditProfileCubit>().emitPickImageState(),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 52.0.r,
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 50.0.r,
                    backgroundColor: Colors.white,
                    child: AppData.userModel.avatar == ''
                        ? Image.asset(
                            'assets/images/boy.png',
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: AppData.userModel.avatar ?? '',
                            placeholder: (context, url) =>
                                const CustomShimmer(),
                            errorWidget: (context, url, error) =>
                                const CustomShimmer(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
