import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      firstWidegt: Icon(
        Icons.search,
        color: context.colorScheme.onBackground,
        size: 30,
      ),
      firstTap: () {},
      secondTap: () {},
      secondWidget: Image.asset('assets/images/splash.png'),
    );
  }
}
