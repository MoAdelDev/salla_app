import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorites_clear_all_dialog.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorites_list.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = context.read<FavoritesCubit>();
    return Scaffold(
      backgroundColor: AppColor.lightGreyColor,
      body: Column(
        children: [
          CustomAppBar(
            title: context.locale.favoritesTitle,
            icon2: Icons.clear_all,
            onTap2: () {
              if (mounted) {
                if (favoritesCubit.favorites.isEmpty) {
                  showToast(context.locale.noFavoritesYet);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: favoritesCubit,
                        ),
                        BlocProvider.value(
                          value: context.read<HomeBodyCubit>(),
                        ),
                      ],
                      child: const FavoritesClearAllDialog(),
                    ),
                  );
                }
              }
            },
          ),
          const Expanded(
            child: FavoritesList(),
          ),
        ],
      ),
    );
  }
}
