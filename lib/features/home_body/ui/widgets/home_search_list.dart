import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_state.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_image_discount.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_price.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_title.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeSearchList extends StatelessWidget {
  const HomeSearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
      ),
      child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
        builder: (context, state) {
          HomeBodyCubit cubit = context.read<HomeBodyCubit>();
          if (cubit.filteredProducts.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noProductsFound,
                style: AppTexts.text14BlackCairoBold,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                ),
                child: Text(
                  S.of(context).productsFound,
                  style: AppTexts.text14BlackCairoBold,
                ),
              ),
              verticalSpace(10.0),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0.w,
                  ),
                  itemBuilder: (context, index) {
                    final product = cubit.filteredProducts[index];
                    return CustomInkwell(
                      onTap: () {
                        context.push(
                          Routes.productDetails,
                          arguments:
                              ProductDetailsScreenArgs(productId: product.id),
                        );
                      },
                      child: Row(
                        children: [
                          ProductImageDiscount(productModel: product),
                          horizontalSpace(5.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductTitle(
                                  title: product.name,
                                ),
                                verticalSpace(5.0),
                                ProductPrice(
                                  discount: product.discount,
                                  oldPrice: product.price,
                                  price: product.oldPrice,
                                ),
                              ],
                            ),
                          ),
                          horizontalSpace(5.0),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey[700]!,
                            size: 30,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return verticalSpace(10.0);
                  },
                  itemCount: cubit.filteredProducts.length,
                ),
              ),
              verticalSpace(10.0),
              const Divider(
                color: Colors.black12,
                thickness: 1.0,
                height: 1.0,
              ),
              verticalSpace(10.0),
              CustomInkwell(
                onTap: () {
                  SearchScreenArgs args = SearchScreenArgs(
                    context: context,
                  );
                  context.push(
                    Routes.search,
                    arguments: args,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: AppColor.lightGreyColor,
                        child: const Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                        ),
                      ),
                      horizontalSpace(10.0),
                      Text(
                        S.of(context).seeAllSearchResults,
                        style: AppTexts.text14BlackCairoSemiBold,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
