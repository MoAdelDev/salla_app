import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      bottomNavigationBar: SafeArea(
        bottom: Platform.isAndroid,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0.w,
            vertical: 10.0.h,
          ),
          height: 70.0.h,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomHomeNavigation(
                iconData:
                    currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                label: S.of(context).homeTitle,
                isSelected: currentIndex == 0,
                onTap: () => setState(() {
                  currentIndex = 0;
                }),
              ),
              CustomHomeNavigation(
                iconData: Icons.favorite,
                label: S.of(context).favoritesTitle,
                isSelected: currentIndex == 1,
                onTap: () => setState(() {
                  currentIndex = 1;
                }),
              ),
              CustomHomeNavigation(
                iconData: Icons.shopping_cart,
                label: S.of(context).cartTitle,
                isSelected: currentIndex == 2,
                onTap: () => setState(() {
                  currentIndex = 2;
                }),
              ),
              CustomHomeNavigation(
                iconData: Icons.settings,
                label: S.of(context).settingsTitle,
                isSelected: currentIndex == 3,
                onTap: () => setState(() {
                  currentIndex = 3;
                }),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CustomLoadingIndicator(
                size: 60,
              ),
            );
          }
          return SafeArea(
            bottom: false,
            child: context.read<HomeCubit>().screens[currentIndex],
          );
        },
      ),
    );
  }
}
