import 'package:salla_app/generated/l10n.dart';

class Language {
  final String name;
  final String code;
  final String flag;

  Language(this.name, this.code, this.flag);
}

List<Language> languages = [
  Language(S.current.englishTitle, "en", "🇬🇧"),
  Language(S.current.arabicTitle, "ar", "🇪🇬"),
];
