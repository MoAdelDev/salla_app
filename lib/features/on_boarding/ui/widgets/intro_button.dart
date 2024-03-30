import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/generated/l10n.dart';

class IntroButton extends StatefulWidget {
  const IntroButton({super.key});

  @override
  State<IntroButton> createState() => _IntroButtonState();
}

class _IntroButtonState extends State<IntroButton> {
  double buttonOffset = 0.0;
  @override
  Widget build(BuildContext context) {
    double buttonWidth = 300.w;
    return GestureDetector(
      onPanUpdate: (details) async {
        if (AppData.isArabic) {
          if (details.delta.dx < 0 && buttonOffset <= buttonWidth) {
            setState(() {
              buttonOffset = buttonOffset - details.delta.dx;
            });
          }
        } else {
          if (details.delta.dx > 0 && buttonOffset <= buttonWidth) {
            setState(() {
              buttonOffset = buttonOffset + details.delta.dx;
            });
          }
        }
      },
      onPanEnd: (_) {
        setState(() {
          if (buttonOffset > buttonWidth / 2) {
            setState(() {
              buttonOffset = buttonWidth - 70.w;
            });
            context.push(Routes.onBoarding);
            buttonOffset = 0.0;
          } else {
            buttonOffset = 0.0;
          }
        });
      },
      child: Container(
        width: buttonWidth,
        height: 60.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            40.0,
          ),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: buttonOffset + 70.w,
              height: 60.0.h,
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(
                  40.0,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 58.0.h,
                  width: 70.0.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  S.of(context).getStarted,
                  style: AppTexts.text20WhiteLatoBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
