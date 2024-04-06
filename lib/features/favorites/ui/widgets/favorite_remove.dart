import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/features/favorites/data/models/favorites_response.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class FavoriteRemove extends StatefulWidget {
  final FavoriteModel favoriteModel;
  const FavoriteRemove({super.key, required this.favoriteModel});

  @override
  State<FavoriteRemove> createState() => _FavoriteRemoveState();
}

class _FavoriteRemoveState extends State<FavoriteRemove> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          if (context.read<HomeBodyCubit>().favorites.isEmpty) {
            showToast(S.of(context).pleaseWaitToLoadProducts);
          } else {
            context.read<FavoritesCubit>().emitRemoveFavoriteState(
                  widget.favoriteModel,
                  context.read<HomeBodyCubit>(),
                );
          }
        }
      },
      child: Icon(
        Icons.delete,
        size: 25.0,
        color: context.colorScheme.primary,
      ),
    );
  }
}
