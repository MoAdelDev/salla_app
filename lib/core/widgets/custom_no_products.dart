import 'package:flutter/material.dart';

class CustomNoProducts extends StatelessWidget {
  const CustomNoProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/no.png'),
    );
  }
}
