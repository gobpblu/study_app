import 'package:study_app/features/languages/domain/language_type.dart';

abstract interface class LanguagesLocalRepository {
  void saveUserLanguage(LanguageType language);
  LanguageType getUserLanguage();
}