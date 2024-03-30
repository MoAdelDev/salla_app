import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/settings/ui/widgets/settings_edit_profile_button.dart';

class SettingsUserDataAndButton extends StatefulWidget {
  const SettingsUserDataAndButton({super.key});

  @override
  State<SettingsUserDataAndButton> createState() =>
      _SettingsUserDataAndButtonState();
}

class _SettingsUserDataAndButtonState extends State<SettingsUserDataAndButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 52.0.r,
              backgroundColor: Colors.black,
              child: ClipOval(
                child: CircleAvatar(
                  radius: 50.0.r,
                  backgroundColor: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: AppData.userModel.avatar ?? '',
                    placeholder: (context, url) => const CustomShimmer(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/boy.png',
                      fit: BoxFit.cover,
                    ),
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
        SettingsEditProfileButton(
          onListen: () {
            setState(() {});
          },
        ),
      ],
    );
  }
}
