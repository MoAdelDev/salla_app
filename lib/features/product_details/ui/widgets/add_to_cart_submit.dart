import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/generated/l10n.dart';

class AddToCartSubmit extends StatefulWidget {
  final ProductModel product;
  const AddToCartSubmit({super.key, required this.product});

  @override
  State<AddToCartSubmit> createState() => _AddToCartSubmitState();
}

class _AddToCartSubmitState extends State<AddToCartSubmit> {
  bool inCart = false;
  @override
  void initState() {
    super.initState();
    if (inCart == widget.product.inCart) {
      inCart = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0.w,
      ),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          onPressed: () {
            setState(() {
              inCart = !inCart;
            });
          },
          text: inCart
              ? S.of(context).removeFromCartTitle
              : S.of(context).addToCartTitle,
        ),
      ),
    );
  }
}
