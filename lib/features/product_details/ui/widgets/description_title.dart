import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).descriptionTitle,
          style: AppTexts.text22BlackLatoBold,
        ),
        Container(
          color: context.colorScheme.primary,
          height: 3.0.h,
          width: 70.0.w,
        ),
      ],
    );
  }
}
