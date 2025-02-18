import 'package:study_app/features/languages/domain/language_type.dart';
import 'package:study_app/features/languages/domain/repository/languages_local_repository.dart';

class LanguagesLocalRepositoryImpl implements LanguagesLocalRepository {

  LanguageType _languageType = LanguageType.english;

  @override
  void saveUserLanguage(LanguageType language) {
    _languageType = language;
  }
  @override
  LanguageType getUserLanguage() {
    return _languageType;
  }
}