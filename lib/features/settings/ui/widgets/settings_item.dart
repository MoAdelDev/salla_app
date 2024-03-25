import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';

class SettingsItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final String? subTitle;
  final Color? color;

  const SettingsItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.subTitle,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: CustomInkwell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 5.0.h,
                horizontal: 10.0.w,
              ),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            horizontalSpace(10.0),
            Text(
              title,
              style: AppTexts.text16BlackLatoBold.copyWith(color: color),
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
    );
  }
}
