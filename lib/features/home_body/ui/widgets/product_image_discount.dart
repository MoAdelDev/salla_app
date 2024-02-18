import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class ProductImageDiscount extends StatelessWidget {
  const ProductImageDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          SizedBox(
            height: 180,
            child: CachedNetworkImage(
              imageUrl:
                  "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
              placeholder: (context, url) => const CustomShimmer(),
              errorWidget: (context, url, error) => const CustomShimmer(),
            ),
          ),
          if (true)
            Container(
              color: Theme.of(context).colorScheme.primary,
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              child: Text(
                '- ${25} %',
                style: AppTexts.text14WhiteLatoRegular,
              ),
            )
        ],
      ),
    );
  }
}
