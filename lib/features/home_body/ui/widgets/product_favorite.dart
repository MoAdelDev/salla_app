import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

class ProductFavorite extends StatelessWidget {
  final ProductModel productModel;
  const ProductFavorite({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        return CustomInkwell(
          onTap: () {
            context.read<HomeBodyCubit>().emitChangeFavoriteState(
                  product: productModel,
                  favoritesCubit: context.read<FavoritesCubit>(),
                );
          },
          child: Icon(
            context.read<HomeBodyCubit>().favorites[productModel.id] ?? false
                ? Icons.favorite
                : Icons.favorite_border,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
