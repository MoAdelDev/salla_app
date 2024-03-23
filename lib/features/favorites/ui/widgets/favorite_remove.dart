import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

class FavoriteRemove extends StatefulWidget {
  final FavoriteModel favoriteModel;
  const FavoriteRemove({super.key, required this.favoriteModel});

  @override
  State<FavoriteRemove> createState() => _FavoriteRemoveState();
}

class _FavoriteRemoveState extends State<FavoriteRemove> {
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        if (mounted) {
          context.read<FavoritesCubit>().emitRemoveFavoriteState(
                widget.favoriteModel,
                context.read<HomeBodyCubit>(),
              );
        }
      },
      text: 'Remove',
    );
  }
}
