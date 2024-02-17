import 'package:flutter/material.dart';

class SallaApp extends StatelessWidget {
  const SallaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Salla App'),
        ),
      ),
    );
  }
}
