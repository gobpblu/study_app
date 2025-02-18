import 'package:study_app/features/languages/domain/language_type.dart';

abstract interface class LanguagesRemoteRepository {
  Future<bool> saveUserLanguage(LanguageType language, String uid);
}