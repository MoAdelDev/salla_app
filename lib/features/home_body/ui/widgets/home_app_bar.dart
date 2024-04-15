import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  final List<ProductModel> products;
  const HomeAppBar({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 10.0.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0.w,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CustomInkwell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/app.svg',
                    height: 35.h,
                  ),
                  horizontalSpace(3.0),
                  Text(
                    'Salla',
                    style: AppTexts.text14WhiteCairoBold,
                  )
                ],
              ),
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: CustomTextField(
                controller: context.read<HomeBodyCubit>().searchController,
                hintText: S.of(context).searchForProducts,
                errorMsg: '',
                onTap: () {},
                prefixIcon: CupertinoIcons.search,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChange: (value) {
                  if (!context.read<HomeBodyCubit>().isSearchContainerVisible) {
                    context
                        .read<HomeBodyCubit>()
                        .emitShowSearchContainerState(true);
                  }
                  context.read<HomeBodyCubit>().emitSearhcState(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
