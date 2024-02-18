import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';

class CategoryTile extends StatelessWidget {
  final bool isSelected;
  const CategoryTile({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: !isSelected ? Colors.grey : Colors.black,
            width: 1.0,
          ),
          color: isSelected ? Colors.black : null,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Center(
          child: Text(
            'Sports',
            style: AppTexts.text16WhiteLatoBold
                .copyWith(color: isSelected ? Colors.white : Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
