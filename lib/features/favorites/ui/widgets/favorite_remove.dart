import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';

class FavoriteRemove extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteRemove({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () => context
          .read<FavoritesCubit>()
          .emitRemoveFavoriteState(favoriteModel, context),
      text: 'Remove',
    );
  }
}
