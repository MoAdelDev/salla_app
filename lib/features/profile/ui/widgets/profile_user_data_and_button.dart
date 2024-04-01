import 'package:flutter/material.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_edit_profile_button.dart';
import 'package:salla_app/features/profile/ui/widgets/user_avatar.dart';

class ProfileUserDataAndButton extends StatefulWidget {
  const ProfileUserDataAndButton({super.key});

  @override
  State<ProfileUserDataAndButton> createState() =>
      _ProfileUserDataAndButtonState();
}

class _ProfileUserDataAndButtonState extends State<ProfileUserDataAndButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            UserAvatar(image: AppData.userModel.avatar ?? ''),
            horizontalSpace(5.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppData.userModel.name,
                    style: AppTexts.text18BlackLatoBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(5.0),
                  Text(
                    AppData.userModel.email,
                    style: AppTexts.text14BlackLatoRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
        verticalSpace(10.0),
        ProfileEditProfileButton(
          onListen: () {
            setState(() {});
          },
        ),
      ],
    );
  }
}
