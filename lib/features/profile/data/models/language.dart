import '../../../../core/localization/generated/l10n.dart';

class Language {
  final String name;
  final String code;
  final String flag;

  Language(this.name, this.code, this.flag);
}

List<Language> languages = [
  Language(AppLocalizations.current.englishTitle, "en", "🇬🇧"),
  Language(AppLocalizations.current.arabicTitle, "ar", "🇪🇬"),
];
