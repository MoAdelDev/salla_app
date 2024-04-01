import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_shimmer.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  const UserAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 52.0.r,
      backgroundColor: context.colorScheme.primary,
      child: ClipOval(
        child: CircleAvatar(
          radius: 50.0.r,
          backgroundColor: Colors.grey.shade400,
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CustomShimmer(),
            errorWidget: (context, url, error) => const Icon(
              Icons.person,
              size: 55.0,
            ),
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
    );
  }
}
