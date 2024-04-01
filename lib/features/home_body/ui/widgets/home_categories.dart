import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/category_shimmer.dart';
import 'package:salla_app/features/home_body/ui/widgets/category_tile.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        builder: (context, state) {
          List<CategoryModel> categories =
              context.read<HomeBodyCubit>().categories;
          if (categories.isEmpty) {
            return ListView.separated(
              itemBuilder: (contex, index) => SizedBox(
                height: 20.0.h,
                width: 80.0.h,
                child: const CategoryShimmer(),
              ),
              separatorBuilder: (context, index) => horizontalSpace(10.0),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            );
          }
          return SizedBox(
            height: 60.0.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CategoryTile(
                    isSelected: selectedIndex == -1,
                    categoryModel: CategoryModel(0, S.of(context).all, ''),
                    onTap: () {
                      if (selectedIndex != -1 &&
                          context.read<HomeBodyCubit>().isProductsLoading ==
                              false) {
                        selectedIndex = -1;
                        context.read<HomeBodyCubit>().emitProductsState();
                      }
                    },
                  ),
                  horizontalSpace(10.0),
                  ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return horizontalSpace(10.0);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryTile(
                          onTap: () {
                            if (selectedIndex != index &&
                                context
                                        .read<HomeBodyCubit>()
                                        .isProductsLoading ==
                                    false) {
                              selectedIndex = index;
                              context
                                  .read<HomeBodyCubit>()
                                  .emitGetProductsByCategoryState(
                                      categoryId: categories[index].id);
                            }
                          },
                          isSelected: selectedIndex == index,
                          categoryModel: categories[index],
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
