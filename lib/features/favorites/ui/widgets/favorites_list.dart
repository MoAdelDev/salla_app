import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_no_products.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_state.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_tile.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_vertical.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        FavoritesCubit cubit = context.read<FavoritesCubit>();
        List<FavoriteModel> favorites = cubit.favorites;
        if (state is Loading || cubit.isFavoritesLoading) {
          return ListView.separated(
            itemBuilder: (context, index) => const ProductShimmerVertical(),
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: 30,
            physics: const NeverScrollableScrollPhysics(),
          );
        }
        if (favorites.isEmpty) {
          return CustomNoProducts(
            text: context.locale.noProductsTitle,
          );
        }
        return ListView.separated(
          itemCount: favorites.length,
          separatorBuilder: (context, index) => verticalSpace(10.0),
          itemBuilder: (context, index) {
            return FavoriteTile(
              favoriteModel: favorites[index],
            );
          },
        );
      },
    );
  }
}
