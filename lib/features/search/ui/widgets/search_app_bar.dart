import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 10.0.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomInkwell(
            onTap: () => context.pop(),
            child: Container(
              height: 38.0.h,
              width: 38.0.w,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: const Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: CustomTextField(
                controller: context.read<HomeBodyCubit>().searchController,
                hintText: 'Search for products',
                errorMsg: '',
                onTap: () {},
                prefixIcon: CupertinoIcons.search,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChange: (value) {
                  if (!context.read<HomeBodyCubit>().isSearchContainerVisible) {
                    context
                        .read<HomeBodyCubit>()
                        .emitShowSearchContainerState(true);
                  }
                  context.read<HomeBodyCubit>().emitSearhcState(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
