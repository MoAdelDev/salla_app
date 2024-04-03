import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_cubit.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/generated/l10n.dart';

class AddressTile extends StatelessWidget {
  final AddressModel address;
  const AddressTile({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context
              .push(
            Routes.addAddress,
            arguments: AddOrEditScreenArgs(
              address: address,
            ),
          )
              .then((value) {
            context.read<AddressesCubit>().emitAddressState();
          }),
          child: CustomContainerTile(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              leading: const Icon(
                Icons.location_city,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                address.name,
                style: AppTexts.text16BlackLatoBold,
              ),
              subtitle: Text(
                '${address.city}, ${address.region}\n${address.details}',
                style: AppTexts.text14BlackLatoRegular,
              ),
            ),
          ),
        ),
        Positioned(
          left: AppData.isArabic ? 20.w : null,
          right: AppData.isArabic ? null : 20.w,
          top: 0,
          child: GestureDetector(
            onTap: () =>
                context.read<AddressesCubit>().emitDeleteAddress(address.id),
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  S.of(context).deleteTitle,
                  style: AppTexts.text14WhiteLatoBold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
