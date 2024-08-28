import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_action.dart';
import 'package:salla_app/features/home_body/ui/widgets/products_header_shimmer.dart';
import 'package:salla_app/features/home_body/ui/widgets/sort_by_bottom_sheet.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        buildWhen: (previous, current) =>
            current is ProductsSuccess ||
            current is ProductsError ||
            current is ProductsLoading,
        builder: (context, state) {
          HomeBodyCubit cubit = context.read<HomeBodyCubit>();
          if (cubit.products.isEmpty ||
              state is ProductsLoading ||
              state is ProductsError) {
            return const ProductsHeaderShimmer();
          }
          return Row(
            children: [
              Text(
                '${cubit.products.length} ${context.locale.productsTitle}',
                style: AppTexts.text16BlackCairoBold,
              ),
              const Spacer(),
              Row(
                children: [
                  ProductsAction(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<HomeBodyCubit>(),
                            child: const SortByBottomSheet(),
                          );
                        },
                      );
                    },
                    icon: 'assets/icons/sort.svg',
                  ),
                  horizontalSpace(10.0),
                  ProductsAction(
                    onTap: () => cubit.emitChangeProductsViewState(),
                    icon: cubit.isGridView
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
