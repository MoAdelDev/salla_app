import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';

class CustomHomeNavigation extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomHomeNavigation({
    super.key,
    required this.iconData,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.symmetric(
                horizontal: 15.0.w,
                vertical: 3.0.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(
                iconData,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            if (isSelected)
              Text(
                label,
                style: AppTexts.text14BlackLatoBold,
              ),
          ],
        ),
      ),
    );
  }
}
