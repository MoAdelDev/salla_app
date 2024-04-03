import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_address_item.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_vertical.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutAddresses extends StatelessWidget {
  const CheckoutAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainerTile(
          child: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              CheckoutCubit cubit = context.read<CheckoutCubit>();
              if (cubit.addresses == null) {
                return ListView.separated(
                  itemBuilder: (context, index) =>
                      const ProductShimmerVertical(),
                  separatorBuilder: (context, index) => verticalSpace(5.0),
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).myAddressesTitle,
                    style: AppTexts.text16BlackCairoBold,
                  ),
                  verticalSpace(5.0),
                  if (cubit.addresses?.isEmpty ?? false)
                    Center(
                      child: Text(
                        S.of(context).noAddressTitle,
                        style: AppTexts.text16BlackCairoBold,
                      ),
                    ),
                  if (cubit.addresses?.isNotEmpty ?? false)
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CheckoutAddressItem(
                          onChanged: (p0) => state is AddOrderLoading
                              ? null
                              : cubit.emitSelectAddressState(
                                  cubit.addresses![index].id),
                          value: cubit.addresses![index].id,
                          radioSelected: cubit.addressSelectedId,
                          address: cubit.addresses![index],
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(10.0),
                      itemCount: cubit.addresses?.length ?? 0,
                    ),
                ],
              );
            },
          ),
        ),
        Positioned(
          right: AppData.isArabic ? null : 20.w,
          left: AppData.isArabic ? 20.w : null,
          top: -4.h,
          child: GestureDetector(
            onTap: () => context.push(Routes.addAddress).then(
              (value) {
                context.read<CheckoutCubit>().emitAddressesState();
              },
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 5.0.h,
              ),
              child: Text(
                S.of(context).add,
                style: AppTexts.text14WhiteLatoBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
