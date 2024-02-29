import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_no_products.dart';
import 'package:salla_app/core/widgets/custom_shimmer_list.dart';
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
          return const CustomShimmerList();
        }
        if (favorites.isEmpty) {
          return const CustomNoProducts();
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
