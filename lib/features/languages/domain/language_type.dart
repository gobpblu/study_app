import 'package:study_app/generated/l10n.dart';

enum LanguageType {
  english,
  kyrgyz;

  String get iconPath => switch (this) {
        LanguageType.english => 'assets/icons/languages/english_language.svg',
        LanguageType.kyrgyz => 'assets/icons/languages/kyrgyz_language.svg',
      };

  String get title => switch (this) {
    LanguageType.english => S.current.language_type_english,
    LanguageType.kyrgyz => S.current.language_type_kyrgyz,
  };
}
