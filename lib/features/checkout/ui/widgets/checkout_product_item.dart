import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg',
          width: 70.0.w,
          height: 70.0.h,
          errorListener: (value) => const CustomShimmer(),
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Stack(
              alignment: Alignment.center,
              children: [
                const CustomShimmer(),
                Text(
                  '${downloadProgress.progress}%',
                  style: AppTexts.text14BlackLatoBold,
                ),
              ],
            );
          },
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0.r),
                image: DecorationImage(
                  image: imageProvider,
                ),
              ),
            );
          },
        ),
        horizontalSpace(5.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: AppTexts.text16WhiteLatoBold,
              ),
              verticalSpace(10.0),
              Row(
                children: [
                  Text(
                    'Quantity -> 1',
                    style: AppTexts.text14WhiteLatoRegular,
                  ),
                  const Spacer(),
                  Text(
                    '200 EGP',
                    style: AppTexts.text14WhiteLatoBold,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
