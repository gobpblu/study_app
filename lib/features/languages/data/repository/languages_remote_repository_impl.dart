import 'package:study_app/features/languages/data/service/languages_db_service.dart';
import 'package:study_app/features/languages/domain/language_type.dart';
import 'package:study_app/features/languages/domain/repository/languages_remote_repository.dart';

class LanguagesRemoteRepositoryImpl implements LanguagesRemoteRepository {
  final LanguagesDbService _dbService;

  LanguagesRemoteRepositoryImpl({
    required LanguagesDbService dbService,
  }) : _dbService = dbService;

  @override
  Future<bool> saveUserLanguage(LanguageType language, String uid) {
    return _dbService.saveUserLanguage(language, uid);
  }
}
