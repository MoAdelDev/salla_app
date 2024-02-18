import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_banner.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            firstWidegt: Icon(
              Icons.search,
              color: context.colorScheme.onBackground,
              size: 30,
            ),
            firstTap: () {},
            secondTap: () {},
            secondWidget: Image.asset('assets/images/splash.png'),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeBanner(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    S.of(context).productsTitle,
                    style: AppTexts.text22BlackLatoBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
