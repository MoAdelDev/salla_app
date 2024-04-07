import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/search/ui/widgets/search_app_bar.dart';
import 'package:salla_app/features/search/ui/widgets/search_filtered_products.dart';
import 'package:salla_app/features/search/ui/widgets/search_products_header.dart';

class SearchScreen extends StatelessWidget {
  final BuildContext context;
  const SearchScreen({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBodyCubit, HomeBodyState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchAppBar(),
                  verticalSpace(10.0),
                  const SearchProductsHeader(),
                  verticalSpace(10.0),
                  const SearchFilteredProducts(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
