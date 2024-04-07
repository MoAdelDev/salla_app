import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_action.dart';
import 'package:salla_app/generated/l10n.dart';

class SearchProductsHeader extends StatelessWidget {
  const SearchProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        builder: (context, state) {
          HomeBodyCubit cubit = context.read<HomeBodyCubit>();
          return Row(
            children: [
              Text(
                '${cubit.filteredProducts.length} ${S.of(context).productsTitle}',
                style: AppTexts.text16BlackCairoBold,
              ),
              const Spacer(),
              ProductsAction(
                onTap: () => cubit.emitChangeProductsViewState(),
                icon: cubit.isProductsHorizontal
                    ? 'assets/icons/vertical.svg'
                    : 'assets/icons/horizontal.svg',
              ),
            ],
          );
        },
      ),
    );
  }
}
