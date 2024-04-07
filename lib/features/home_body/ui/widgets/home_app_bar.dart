import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';

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
          SvgPicture.asset(
            'assets/icons/app.svg',
            width: 35.w,
            height: 35.h,
          ),
          horizontalSpace(10.0),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: CustomTextField(
                controller: context.read<HomeBodyCubit>().searchController,
                hintText: 'Search for products',
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
          horizontalSpace(10.0),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 25.w,
              height: 25.h,
            ),
          ),
        ],
      ),
    );
  }
}
