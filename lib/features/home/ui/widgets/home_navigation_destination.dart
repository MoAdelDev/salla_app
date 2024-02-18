import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';

class HomeNavigationDestination extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  const HomeNavigationDestination({
    super.key,
    required this.iconData,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        iconData,
        color: !isSelected
            ? context.colorScheme.onBackground.withOpacity(0.6)
            : Colors.white,
      ),
      label: label,
      tooltip: label,
    );
  }
}
