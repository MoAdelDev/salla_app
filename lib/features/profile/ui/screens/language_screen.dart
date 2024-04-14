import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/networking/dio_factory.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/home/ui/screens/home_screen.dart';
import 'package:salla_app/features/profile/data/models/language.dart';
import 'package:salla_app/generated/l10n.dart';
import 'package:salla_app/salla_app/locale_cubit.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = AppData.isArabic ? languages[1] : languages[0];
  }

  @override
  Widget build(BuildContext context) {
    languages = [
      Language(S.of(context).englishTitle, "en", "🇬🇧"),
      Language(S.of(context).arabicTitle, "ar", "🇪🇬"),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10.0),
            Center(
              child: Container(
                width: 100.0.w,
                height: 10.0.h,
                decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            verticalSpace(16.0),
            Text(
              S.of(context).selectLanguage,
              style: AppTexts.text18BlackCairoBold,
            ),
            verticalSpace(10.0),
            Text(
              S.of(context).selectLanguageBody,
              style: AppTexts.text16BlackCairoRegular,
            ),
            verticalSpace(16.0),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  Language lang = languages[index];
                  bool isSelected = lang.code == selectedLanguage.code;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColor.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        leading: Text(lang.flag,
                            style: const TextStyle(fontSize: 24)),
                        title: Text(
                          lang.name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0.h,
              ),
              child: CustomButton(
                onPressed: () => saveLanguageAndGetTheNewData(),
                text: S.of(context).saveTitle,
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveLanguageAndGetTheNewData() async {
    await context.read<LocaleCubit>().changeLocale(selectedLanguage.code, '');
    DioFactory.instance = null;
    getIt.reset().then((value) {
      setupGetIt().then((value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      });
    });
  }
}
