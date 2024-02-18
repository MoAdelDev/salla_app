import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      icon1: CupertinoIcons.search,
      onTap1: () {},
      onTap2: () {},
      icon2: Icons.language,
    );
  }
}
