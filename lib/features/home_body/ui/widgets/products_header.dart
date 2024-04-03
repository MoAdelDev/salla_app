import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_action.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_header_shimmer.dart';
import 'package:salla_app/generated/l10n.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 10.w,
      ),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        builder: (context, state) {
          HomeBodyCubit cubit = context.read<HomeBodyCubit>();
          if (cubit.products.isEmpty ||
              context.read<HomeBodyCubit>().isProductsLoading) {
            return const ProductsHeaderShimmer();
          }
          return Row(
            children: [
              Text(
                '${cubit.products.length} ${S.of(context).productsTitle}',
                style: AppTexts.text16BlackLatoBold,
              ),
              const Spacer(),
              Row(
                children: [
                  ProductsAction(
                    onTap: () {},
                    icon: 'assets/icons/sort.svg',
                  ),
                  horizontalSpace(10.0),
                  ProductsAction(
                    onTap: () {},
                    icon: 'assets/icons/filter.svg',
                  ),
                  horizontalSpace(10.0),
                  ProductsAction(
                    onTap: () => cubit.emitChangeProductsViewState(),
                    icon: cubit.isProductsHorizontal
                        ? 'assets/icons/vertical.svg'
                        : 'assets/icons/horizontal.svg',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
