import 'package:flutter/material.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/core/helpers/cache_helper.dart';

class LocaleCubit extends BaseSafeCubit<Locale> {
  LocaleCubit() : super(const Locale('en', 'US'));

  void getLanguage(BuildContext context) async {
    if (await CacheHelper.language == 'ar') {
      AppData.isArabic = true;
      emit(const Locale('ar', 'EG'));
    }
  }

  Future<void> changeLocale(String languageCode, String countryCode) async {
    AppData.isArabic = languageCode == 'ar';
    await CacheHelper.changeLanguage(value: languageCode);
    emit(Locale(languageCode, countryCode));
  }
}
