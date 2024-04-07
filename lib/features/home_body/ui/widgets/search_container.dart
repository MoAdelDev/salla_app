import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/home_search_list.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        HomeBodyCubit cubit = context.read<HomeBodyCubit>();
        if (cubit.isSearchContainerVisible) {
          return Container(
            height: 400.h,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 30.w,
              right: 30.w,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: const HomeSearchList(),
          );
        }
        return Container();
      },
    );
  }
}
