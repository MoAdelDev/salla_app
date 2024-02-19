import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';

class ProductFavorite extends StatelessWidget {
  final int productId;
  const ProductFavorite({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBodyCubit, HomeBodyState>(
      listener: (context, state) {
        if (state is UpdateFavorites) {
          context.showSnackBar('Updated');
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<HomeBodyCubit>().emitChangeFavoriteState(
                  productId: productId,
                  context: context,
                );
          },
          icon: Icon(
            context.read<HomeBodyCubit>().favorites[productId] ?? false
                ? Icons.favorite
                : Icons.favorite_border,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
