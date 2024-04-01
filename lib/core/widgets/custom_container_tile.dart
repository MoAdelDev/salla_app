import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';

class CustomContainerTile extends StatelessWidget {
  final Widget child;
  const CustomContainerTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}
