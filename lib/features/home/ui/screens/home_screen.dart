import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/notification_helper.dart';
import 'package:salla_app/core/helpers/permissions.dart';
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
  void initState() {
    super.initState();
    requestNotificationPermission().then(
      (value) {
        if (value) {
          NotificationHelper.initLocalNotifications();
        }
      },
    );
  }

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
          height: 75.0.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomHomeNavigation(
                iconData: currentIndex == 0
                    ? CupertinoIcons.house_fill
                    : CupertinoIcons.house,
                label: S.of(context).homeTitle,
                isSelected: currentIndex == 0,
                onTap: () => setState(
                  () {
                    currentIndex = 0;
                  },
                ),
              ),
              CustomHomeNavigation(
                iconData: currentIndex == 1
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                label: S.of(context).favoritesTitle,
                isSelected: currentIndex == 1,
                onTap: () => setState(() {
                  currentIndex = 1;
                }),
              ),
              CustomHomeNavigation(
                iconData: currentIndex == 2
                    ? CupertinoIcons.cart_fill
                    : CupertinoIcons.cart,
                label: S.of(context).cartTitle,
                isSelected: currentIndex == 2,
                onTap: () => setState(() {
                  currentIndex = 2;
                }),
              ),
              CustomHomeNavigation(
                iconData: currentIndex == 3
                    ? CupertinoIcons.person_fill
                    : CupertinoIcons.person,
                label: S.of(context).profile,
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
