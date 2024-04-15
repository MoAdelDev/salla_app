import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/texts.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BounceInDown(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Salla',
            style: AppTexts.text50WhiteCairoBold,
          ),
        ),
        BounceInUp(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'سلة',
            style: AppTexts.text50WhiteCairoBold,
          ),
          onFinish: (direction) async {
            await Future.delayed(const Duration(milliseconds: 2000));
            CacheHelper.token.then((token) {
              if (token.isNotEmpty) {
                context.pushAndRemoveUntil(Routes.home);
              } else {
                context.pushAndRemoveUntil(Routes.onBoarding);
              }
            });
          },
        ),
      ],
    );
  }
}
