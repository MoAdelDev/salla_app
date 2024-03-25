import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';

class SettingsUserData extends StatelessWidget {
  const SettingsUserData({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Row(
      children: [
        CircleAvatar(
          radius: 52.0.r,
          backgroundColor: Colors.black,
          child: ClipOval(
            child: CircleAvatar(
              radius: 50.0.r,
              backgroundColor: Colors.white,
              child: CachedNetworkImage(
                imageUrl:
                    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
                placeholder: (context, url) => const CustomShimmer(),
                errorWidget: (context, url, error) => const CustomShimmer(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(5.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.userModel?.name ?? '',
                style: AppTexts.text18BlackLatoBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(5.0),
              Text(
                cubit.userModel?.email ?? '',
                style: AppTexts.text14BlackLatoRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }
}
