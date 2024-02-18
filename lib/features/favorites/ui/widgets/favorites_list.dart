import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/features/favorites/ui/widgets/favorite_tile.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.greyColor,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => verticalSpace(10.0),
        itemBuilder: (context, index) {
          return const FavoriteTile();
        },
      ),
    );
  }
}
