import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
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
                iconTheme:
                    IconThemeData(color: context.colorScheme.onBackground),
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    return const CustomShimmer();
                  },
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: context.colorScheme.primary,
                    size: 40.0,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmer(
                            width: double.infinity,
                            height: 30.0.h,
                          ),
                          verticalSpace(10.0),
                          CustomShimmer(
                            width: 100.w,
                            height: 30.0.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0.h,
                            ),
                            child: CustomShimmer(
                              width: 300.w,
                              height: 30.0.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(300)
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10.0),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomShimmer(
            width: double.infinity,
            height: 60.0.h,
          ),
        ),
        verticalSpace(8.0),
      ],
    );
  }
}
