import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';

import '../../../home_body/logic/cubit/home_body_cubit.dart';

class FavoritesClearAllDialog extends StatelessWidget {
  const FavoritesClearAllDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      contentPadding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      title: Text(
        context.locale.clearAllFavorites,
        style: AppTexts.text16BlackLatoBold,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.locale.areYouWantToClearAllFavorites,
            style: AppTexts.text14BlackLatoRegular,
          ),
          verticalSpace(8),
          SvgPicture.asset(
            'assets/icons/delete_favorite.svg',
            width: 100.w,
            height: 100.h,
          ),
        ],
      ),
      actions: [
        CustomTextButton(
          onPressed: () {
            context.pop();
          },
          text: context.locale.cancel,
          textStyle: AppTexts.text14BlackLatoRegular.copyWith(
            color: context.colorScheme.error,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            context
                .read<FavoritesCubit>()
                .emitRemoveAllFavoriteState(context.read<HomeBodyCubit>());
            context.pop();
          },
          text: context.locale.yes,
          textStyle: AppTexts.text14BlackLatoRegular.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
