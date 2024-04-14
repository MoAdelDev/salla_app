import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salla_app/core/helpers/extensions.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  const CustomLoadingIndicator({super.key, this.size = 50.0, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? context.colorScheme.primary,
      size: size,
      duration: const Duration(milliseconds: 2000),
    );
  }
}
