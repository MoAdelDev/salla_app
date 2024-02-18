import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home/logic/cubit/home_state.dart';
import 'package:salla_app/features/home/ui/widgets/home_navigation_destination.dart';
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
            child: Stack(
              children: [
                context.read<HomeCubit>().screens[currentIndex],
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50.0.h,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.onBackground,
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
                    child: NavigationBar(
                      selectedIndex: currentIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      elevation: 2.0,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.onlyShowSelected,
                      animationDuration: const Duration(milliseconds: 300),
                      indicatorColor: context.colorScheme.primary,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      surfaceTintColor: context.colorScheme.primary,
                      shadowColor: context.colorScheme.primary,
                      destinations: [
                        HomeNavigationDestination(
                          iconData: Icons.home_filled,
                          label: S.of(context).homeTitle,
                          isSelected: currentIndex == 0,
                        ),
                        HomeNavigationDestination(
                          iconData: Icons.apps,
                          label: S.of(context).categoriesTitle,
                          isSelected: currentIndex == 1,
                        ),
                        HomeNavigationDestination(
                          iconData: Icons.favorite_rounded,
                          label: S.of(context).favoritesTitle,
                          isSelected: currentIndex == 2,
                        ),
                        HomeNavigationDestination(
                          iconData: Icons.shopping_cart,
                          label: S.of(context).cartTitle,
                          isSelected: currentIndex == 3,
                        ),
                        HomeNavigationDestination(
                          iconData: Icons.settings,
                          label: S.of(context).settingsTitle,
                          isSelected: currentIndex == 4,
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
