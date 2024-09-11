import 'package:study_app/features/auth/domain/repository/auth_remote_repository.dart';

import 'models/user.dart';
import 'repository/user_local_repository.dart';

class AuthInteractor {
  final AuthRemoteRepository _remoteRepository;
  final UserLocalRepository _userLocalRepository;

  AuthInteractor({
    required AuthRemoteRepository remoteRepository,
    required UserLocalRepository userLocalRepository,
  })  : _remoteRepository = remoteRepository,
        _userLocalRepository = userLocalRepository;

  Future<void> logout() async {
    await _remoteRepository.logout();
  }

  User getCurrentUser() {
    return _userLocalRepository.getUser();
  }
}
