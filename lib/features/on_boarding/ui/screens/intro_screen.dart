import 'package:flutter/material.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/features/on_boarding/ui/widgets/intro_button.dart';
import 'package:salla_app/features/on_boarding/ui/widgets/intro_image.dart';
import 'package:salla_app/features/on_boarding/ui/widgets/intro_title.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorLight.primaryColor,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IntroTitle(),
          IntroImage(),
          IntroButton(),
        ],
      ),
    );
  }
}
