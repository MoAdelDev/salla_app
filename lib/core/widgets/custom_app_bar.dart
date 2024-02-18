import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? firstTap;
  final Widget? firstWidegt;
  final VoidCallback? secondTap;
  final Widget? secondWidget;
  const CustomAppBar({
    super.key,
    this.firstTap,
    this.firstWidegt,
    this.title = '',
    this.secondTap,
    this.secondWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 10.0.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (firstTap != null)
            InkWell(
              onTap: firstTap,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 41.0.h,
                width: 41.0.w,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: firstWidegt,
              ),
            ),
          if (title != null)
            Text(
              title ?? '',
              style: GoogleFonts.lato(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (secondTap != null)
            InkWell(
              onTap: secondTap,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 41.0.h,
                width: 41.0.w,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: secondWidget,
              ),
            ),
          if (secondTap == null) const SizedBox.shrink()
        ],
      ),
    );
  }
}
