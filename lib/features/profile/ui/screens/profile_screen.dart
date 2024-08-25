import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home/logic/cubit/home_state.dart';
import 'package:salla_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:salla_app/features/profile/logic/cubit/profile_state.dart';
import 'package:salla_app/features/profile/ui/screens/language_bottom_sheet.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_item.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_shimmer.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_user_data_and_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const ProfileShimmer();
        }
        return BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                showToast(state.message);
                context.pushAndRemoveUntil(Routes.onBoarding);
              }
              if (state is LogoutError) {
                showToast(state.message, isError: true);
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColor.lightGreyColor,
                body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.w,
                    vertical: 20.0.h,
                  ),
                  child: Column(
                    children: [
                      const ProfileUserDataAndButton(),
                      verticalSpace(10.0),
                      ProfileItem(
                        title: context.locale.profile,
                        icon: Icons.person_outline,
                        onTap: () {
                          context.push(Routes.editProfile).then((value) {
                            if (context.mounted) {
                              context.read<ProfileCubit>().emitUserDataState();
                            }
                          });
                        },
                      ),
                      ProfileItem(
                        title: context.locale.myAddressesTitle,
                        icon: Icons.location_on_outlined,
                        onTap: () => context.push(Routes.addresses),
                      ),
                      ProfileItem(
                        title: context.locale.ordersTitle,
                        icon: CupertinoIcons.cart,
                        onTap: () => context.push(Routes.orders),
                      ),
                      ProfileItem(
                        title: context.locale.languageTitle,
                        icon: CupertinoIcons.globe,
                        subTitle: AppData.isArabic ? 'العربية' : 'English',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            builder: (context) => const LanguageBottomSheet(),
                          );
                        },
                      ),
                      state is LogoutLoading
                          ? const Center(child: CustomLoadingIndicator())
                          : ProfileItem(
                              title: context.locale.logoutTitle,
                              icon: CupertinoIcons.power,
                              onTap: () {
                                context.read<ProfileCubit>().emitLogoutState();
                              },
                              color: Colors.red[700],
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
