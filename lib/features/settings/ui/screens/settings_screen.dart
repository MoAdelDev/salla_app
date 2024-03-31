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
import 'package:salla_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:salla_app/features/settings/logic/cubit/settings_state.dart';
import 'package:salla_app/features/settings/ui/widgets/settings_item.dart';
import 'package:salla_app/features/settings/ui/widgets/settings_user_data_and_button.dart';
import 'package:salla_app/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            showToast(state.message);
            context.pushAndRemoveUntil(Routes.intro);
          }
          if (state is LogoutError) {
            showToast(state.message, isError: true);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 20.0.h,
            ),
            child: Column(
              children: [
                const SettingsUserDataAndButton(),
                verticalSpace(10.0),
                SettingsItem(
                  title: S.of(context).myAddressesTitle,
                  icon: Icons.location_history,
                  onTap: () => context.push(Routes.addresses),
                ),
                SettingsItem(
                  title: S.of(context).ordersTitle,
                  icon: Icons.shopping_cart,
                  onTap: () {},
                ),
                SettingsItem(
                  title: S.of(context).languageTitle,
                  icon: Icons.language,
                  subTitle: AppData.isArabic ? 'العربية' : 'English',
                  onTap: () => context.push(Routes.language),
                ),
                SettingsItem(
                  title: S.of(context).contactsTitle,
                  icon: Icons.contact_support,
                  onTap: () {},
                ),
                state is LogoutLoading
                    ? const Center(child: CustomLoadingIndicator())
                    : SettingsItem(
                        title: S.of(context).logoutTitle,
                        icon: Icons.logout,
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
