import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_image_and_discount.dart';

class ProductSliverAppBar extends StatelessWidget {
  final ProductModel product;
  const ProductSliverAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height / 3,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleSpacing: 1,
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
      iconTheme: IconThemeData(color: context.colorScheme.onSurface),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(vertical: 5.0),
            centerTitle: true,
            background: ProductDetailsImageAndDiscount(
              product: product,
            ),
          );
        },
      ),
    );
  }
}
