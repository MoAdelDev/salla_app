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
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/profile/logic/cubit/settings_cubit.dart';
import 'package:salla_app/features/profile/logic/cubit/settings_state.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_item.dart';
import 'package:salla_app/features/profile/ui/widgets/profile_user_data_and_button.dart';
import 'package:salla_app/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
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
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.w,
              vertical: 20.0.h,
            ),
            child: Column(
              children: [
                const ProfileUserDataAndButton(),
                verticalSpace(10.0),
                ProfileItem(
                  title: S.of(context).myAddressesTitle,
                  icon: Icons.location_on_outlined,
                  onTap: () => context.push(Routes.addresses),
                ),
                ProfileItem(
                  title: S.of(context).ordersTitle,
                  icon: CupertinoIcons.cart,
                  onTap: () => context.push(Routes.orders),
                ),
                ProfileItem(
                  title: S.of(context).languageTitle,
                  icon: CupertinoIcons.globe,
                  subTitle: AppData.isArabic ? 'العربية' : 'English',
                  onTap: () => context.push(Routes.language),
                ),
                ProfileItem(
                  title: S.of(context).contactsTitle,
                  icon: CupertinoIcons.phone,
                  onTap: () {},
                ),
                state is LogoutLoading
                    ? const Center(child: CustomLoadingIndicator())
                    : ProfileItem(
                        title: S.of(context).logoutTitle,
                        icon: CupertinoIcons.power,
                        onTap: () {
                          context.read<SettingsCubit>().emitLogoutState();
                        },
                        color: Colors.red[700],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
