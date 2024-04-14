import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/generated/l10n.dart';

class ProductDetailsDescription extends StatefulWidget {
  final String description;
  const ProductDetailsDescription({super.key, required this.description});

  @override
  State<ProductDetailsDescription> createState() =>
      _ProductDetailsDescriptionState();
}

class _ProductDetailsDescriptionState extends State<ProductDetailsDescription> {
  int? maxLines = 10;
  String finalText = '';
  bool isTextFull = false;
  int subStringLength = 200;
  @override
  void initState() {
    super.initState();
    if (widget.description.length > subStringLength) {
      finalText = '${widget.description.substring(0, subStringLength)}...';
    } else {
      finalText = widget.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0.w,
          ),
          child: Text(
            S.of(context).descriptionTitle,
            style: AppTexts.text16BlackLatoBold,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CustomContainerTile(
            child: Text.rich(
              maxLines: maxLines,
              TextSpan(
                children: [
                  TextSpan(
                    text: finalText,
                    style: AppTexts.text14BlackLatoRegular,
                  ),
                  if (widget.description.length > subStringLength)
                    TextSpan(
                      text: isTextFull ? 'Less' : 'See more',
                      style: AppTexts.text14PrimaryLatoBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => setState(() {
                              if (isTextFull) {
                                maxLines = 2;
                                if (widget.description.length > 70) {
                                  finalText =
                                      '${widget.description.substring(0, 70)}...';
                                }
                              } else {
                                maxLines = null;
                                finalText = '${widget.description}...';
                              }
                              isTextFull = !isTextFull;
                            }),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
