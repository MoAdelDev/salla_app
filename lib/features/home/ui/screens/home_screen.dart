import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home/logic/cubit/home_state.dart';
import 'package:salla_app/features/home/ui/widgets/custom_home_navigation.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
                child: CustomLoadingIndicator(
              size: 60,
            ));
          }
          return SafeArea(
            bottom: false,
            child: Stack(
              children: [
                context.read<HomeCubit>().screens[currentIndex],
                Positioned(
                  bottom: 20.0.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0.w,
                      vertical: 10.0.h,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              context.colorScheme.onBackground.withOpacity(0.4),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHomeNavigation(
                          iconData: Icons.home_filled,
                          label: S.of(context).homeTitle,
                          isSelected: currentIndex == 0,
                          onTap: () => setState(() {
                            currentIndex = 0;
                          }),
                        ),
                        CustomHomeNavigation(
                          iconData: Icons.apps,
                          label: S.of(context).categoriesTitle,
                          isSelected: currentIndex == 1,
                          onTap: () => setState(() {
                            currentIndex = 1;
                          }),
                        ),
                        CustomHomeNavigation(
                          iconData: Icons.favorite,
                          label: S.of(context).favoritesTitle,
                          isSelected: currentIndex == 2,
                          onTap: () => setState(() {
                            currentIndex = 2;
                          }),
                        ),
                        CustomHomeNavigation(
                          iconData: Icons.shopping_cart,
                          label: S.of(context).cartTitle,
                          isSelected: currentIndex == 3,
                          onTap: () => setState(() {
                            currentIndex = 3;
                          }),
                        ),
                        CustomHomeNavigation(
                          iconData: Icons.settings,
                          label: S.of(context).settingsTitle,
                          isSelected: currentIndex == 4,
                          onTap: () => setState(() {
                            currentIndex = 4;
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
