import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.sizeOf(context).height / 3,
                stretch: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                surfaceTintColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: context.colorScheme.onSurface,
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    return const FlexibleSpaceBar(
                      background: CustomShimmer(),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CustomContainerTile(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmer(
                            height: 8.0.h,
                            width: 250.w,
                          ),
                          verticalSpace(5.0),
                          CustomShimmer(
                            height: 8.0.h,
                            width: 250.w,
                          ),
                          verticalSpace(5.0),
                          CustomShimmer(
                            height: 8.0.h,
                            width: 150.0.w,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w,
                          ),
                          child: Text(
                            context.locale.descriptionTitle,
                            style: AppTexts.text16BlackLatoBold,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomContainerTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomShimmer(
                                  height: 8.0.h,
                                  width: 250.w,
                                ),
                                verticalSpace(8),
                                CustomShimmer(
                                  height: 8.0.h,
                                  width: 250.w,
                                ),
                                verticalSpace(8),
                                CustomShimmer(
                                  height: 8.0.h,
                                  width: 250.w,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(300)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
