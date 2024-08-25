import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/sort_by_item.dart';

class SortByBottomSheet extends StatelessWidget {
  const SortByBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        HomeBodyCubit cubit = context.read<HomeBodyCubit>();
        return SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
              vertical: 10.0.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 100.0.w,
                    height: 10.0.h,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                verticalSpace(16.0),
                Text(
                  context.locale.sortBy,
                  style: AppTexts.text18BlackCairoBold,
                ),
                verticalSpace(16.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomInkwell(
                      onTap: () => cubit.emitChangeSortByState(index: index),
                      child: SortByItem(
                        title: cubit.sortByTitles[index],
                        isSelected: cubit.sortByIndex == index,
                        index: index,
                        groupValue: cubit.sortByIndex,
                        onChanged: (index) => cubit.emitChangeSortByState(
                          index: index ?? 0,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[400],
                    );
                  },
                  itemCount: cubit.sortByTitles.length,
                ),
                verticalSpace(16.0),
                CustomButton(
                  onPressed: () {
                    cubit.emitSortByState(
                      cubit.sortByTitles[cubit.sortByIndex],
                    );
                    context.pop();
                  },
                  text: context.locale.applyTitle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
