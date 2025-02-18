import 'package:study_app/features/auth/domain/repository/user_local_repository.dart';
import 'package:study_app/features/languages/domain/language_type.dart';
import 'package:study_app/features/languages/domain/repository/languages_local_repository.dart';
import 'package:study_app/features/languages/domain/repository/languages_remote_repository.dart';

class LanguagesInteractor {
  final LanguagesRemoteRepository _remoteRepository;
  final LanguagesLocalRepository _localRepository;
  final UserLocalRepository _userRepository;

  LanguagesInteractor({
    required LanguagesRemoteRepository remoteRepository,
    required LanguagesLocalRepository localRepository,
    required UserLocalRepository userLocalRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository,
        _userRepository = userLocalRepository;

  Future saveUserLanguage(LanguageType language) async {
    final uid = _userRepository.getUser()?.uniqueId;
    if (uid != null) {
      await _remoteRepository.saveUserLanguage(language, uid);
    }
    _localRepository.saveUserLanguage(language);
  }

  LanguageType getCurrentLanguage() {
    return _localRepository.getUserLanguage();
  }
}
