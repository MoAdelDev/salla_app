import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/search/logic/cubit/search_cubit.dart';
import 'package:salla_app/features/search/logic/cubit/search_state.dart';
import 'package:salla_app/features/search/ui/widgets/search_list.dart';
import 'package:salla_app/generated/l10n.dart';

class SearchScreen extends StatelessWidget {
  final List<ProductModel> products;
  const SearchScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit cubit = context.read<SearchCubit>();
        return Scaffold(
          backgroundColor: AppColor.greyColor,
          appBar: AppBar(
            title: Text(S.of(context).searchTitle),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 10.0.h,
                ),
                child: CustomTextField(
                  controller: cubit.searchController,
                  hintText: S.of(context).enterProductName,
                  errorMsg: '',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChange: (value) {
                    cubit.search(value);
                  },
                ),
              ),
              Expanded(
                child: SearchList(
                  products: cubit.filteredProducts.isEmpty
                      ? cubit.products
                      : cubit.filteredProducts,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
