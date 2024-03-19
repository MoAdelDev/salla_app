import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String message, {bool isError = false}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: isError ? Colors.red : Colors.green,
    gravity: ToastGravity.TOP,
    textColor: Colors.white,
    fontSize: 16.0.sp,
    toastLength: Toast.LENGTH_LONG,
  );
}
