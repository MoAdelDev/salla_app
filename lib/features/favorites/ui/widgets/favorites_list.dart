import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_state.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_tile.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        List<FavoriteModel> favorites =
            context.read<FavoritesCubit>().favorites;
        if (state is Loading) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                height: 100.0.h,
                child: const CustomShimmer(),
              );
            },
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: 20,
          );
        }
        if (favorites.isEmpty) {
          return Center(
            child: Image.asset('assets/images/no.png'),
          );
        }
        return Container(
          color: AppColor.greyColor,
          child: ListView.separated(
            itemCount: favorites.length,
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemBuilder: (context, index) {
              return FavoriteTile(
                favoriteModel: favorites[index],
              );
            },
          ),
        );
      },
    );
  }
}
