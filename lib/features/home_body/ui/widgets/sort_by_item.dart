import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';

class SortByItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final int groupValue;
  final Function(int?) onChanged;
  const SortByItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.index,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: index,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        horizontalSpace(10),
        Text(
          title,
          style: isSelected
              ? AppTexts.text14BlackCairoBold
              : AppTexts.text14BlackLatoRegular,
        )
      ],
    );
  }
}
