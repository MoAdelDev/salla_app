import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorites_list.dart';
import 'package:salla_app/generated/l10n.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: S.of(context).favoritesTitle,
          icon2: Icons.clear_all,
          onTap2: () => context
              .read<FavoritesCubit>()
              .emitRemoveAllFavoriteState(context),
        ),
        const Expanded(
          child: FavoritesList(),
        ),
      ],
    );
  }
}