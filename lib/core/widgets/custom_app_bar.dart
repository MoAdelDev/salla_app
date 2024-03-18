import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap1;
  final IconData? icon1;
  final VoidCallback? onTap2;
  final IconData? icon2;
  const CustomAppBar({
    super.key,
    this.onTap1,
    this.icon1 = Icons.chevron_left,
    this.title = '',
    this.onTap2,
    this.icon2 = Icons.chevron_right,
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
          if (onTap1 != null)
            InkWell(
              onTap: onTap1,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 41.0.h,
                width: 41.0.w,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Icon(
                  icon1,
                  size: 30.0,
                  color: Colors.white,
                ),
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
          if (onTap2 != null)
            InkWell(
              onTap: onTap2,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 41.0.h,
                width: 41.0.w,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Icon(
                  icon2,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          if (onTap2 == null) const SizedBox.shrink()
        ],
      ),
    );
  }
}
