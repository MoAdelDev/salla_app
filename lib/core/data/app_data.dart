import 'dart:io';

import 'package:salla_app/features/home/data/models/user_model.dart';

class AppData {
  AppData._();

  static bool get isIos => Platform.isIOS;

  static bool isArabic = false;

  static UserModel userModel = UserModel(
    '',
    '',
    '',
    0,
    '',
    0,
    0,
  );
}
