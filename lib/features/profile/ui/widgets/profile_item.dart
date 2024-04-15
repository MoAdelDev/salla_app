import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';

class ProfileItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final String? subTitle;
  final Color? color;

  const ProfileItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.subTitle,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onTap,
      child: CustomContainerTile(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 30.0,
              ),
              horizontalSpace(10.0),
              Text(
                title,
                style: AppTexts.text16BlackCairoRegular.copyWith(color: color),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    subTitle ?? '',
                  ),
                  horizontalSpace(5.0),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
