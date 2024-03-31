import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
      ),
      child: CustomButton(
        onPressed: () => context.push(Routes.addAddress),
        text: S.of(context).addNewAddress,
      ),
    );
  }
}
