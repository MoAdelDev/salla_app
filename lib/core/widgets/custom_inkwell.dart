import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';

class CustomInkwell extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  const CustomInkwell({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomInkwellState();
  }
}

class _CustomInkwellState extends State<CustomInkwell> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
    return InkWell(
      onTap: () async {
        if (!isTapped) {
          setState(() {
            isTapped = true;
          });
          await Future.delayed(const Duration(milliseconds: 160));

          widget.onTap();

          setState(() {
            isTapped = false;
          });
        }
      },
      borderRadius: BorderRadius.circular(10.0),
      splashColor: context.colorScheme.primary.withOpacity(0.2),
      child: widget.child,
    );
  }
}
