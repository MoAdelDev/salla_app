import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorites_list.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: S.of(context).favoritesTitle,
          icon2: Icons.clear_all,
          onTap2: () {
            if (mounted) {
              context
                  .read<FavoritesCubit>()
                  .emitRemoveAllFavoriteState(context.read<HomeBodyCubit>());
            }
          },
        ),
        const Expanded(
          child: FavoritesList(),
        ),
      ],
    );
  }
}
