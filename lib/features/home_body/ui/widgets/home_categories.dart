import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/home_body/data/models/categories_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/category_shimmer.dart';
import 'package:salla_app/features/home_body/ui/widgets/category_tile.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        buildWhen: (previous, current) =>
            current is ChangeCategoryId ||
            current is CategoriesError ||
            current is CategoriesLoading ||
            current is CategoriesSuccess,
        builder: (context, state) {
          int categoryId = context.read<HomeBodyCubit>().categoryId;
          List<CategoryModel> categories =
              context.read<HomeBodyCubit>().categories;
          if (categories.isEmpty ||
              state is CategoriesLoading ||
              state is CategoriesError) {
            return SizedBox(
              height: 50.0.h,
              child: ListView.separated(
                itemBuilder: (contex, index) => SizedBox(
                  height: 20.0.h,
                  width: 80.0.h,
                  child: const CategoryShimmer(),
                ),
                separatorBuilder: (context, index) => horizontalSpace(10.0),
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            );
          }
          return SizedBox(
            height: 50.0.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CategoryTile(
                    isSelected: categoryId == -1,
                    categoryModel: CategoryModel(0, context.locale.all, ''),
                    onTap: () {
                      context.read<HomeBodyCubit>().changeCategoryId(
                            categoryId: -1,
                          );
                    },
                  ),
                  horizontalSpace(10.0),
                  ListView.separated(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return horizontalSpace(10.0);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      CategoryModel categoryModel = categories[index];
                      return CategoryTile(
                        onTap: () {
                          context.read<HomeBodyCubit>().changeCategoryId(
                              categoryId: categories[index].id);
                        },
                        isSelected: categoryId == categoryModel.id,
                        categoryModel: categories[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
