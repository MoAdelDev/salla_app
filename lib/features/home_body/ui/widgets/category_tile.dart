import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';

class CategoryTile extends StatelessWidget {
  final bool isSelected;
  final CategoryModel categoryModel;
  final VoidCallback onTap;
  const CategoryTile({
    super.key,
    required this.isSelected,
    required this.categoryModel,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: 1.0,
          ),
          color: isSelected ? context.colorScheme.primary : Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Center(
          child: Text(
            categoryModel.name,
            style: AppTexts.text16WhiteLatoBold.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
