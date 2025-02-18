import 'package:study_app/features/auth/domain/repository/auth_remote_repository.dart';

import 'models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
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

  User? getCurrentUser() {
    return _userLocalRepository.getUser();
  }

  firebase.User? getCurrentFirebaseUser() {
    return _userLocalRepository.getFirebaseUser();
  }

  Stream<firebase.User?> observeRemoteAuthState() {
    return _remoteRepository.observeAuthState();
  }

  Stream<firebase.User?> observeRemoteUserChanges() {
    return _remoteRepository.observeUserChanges();
  }

  Stream<User?> observeLocalAuthState() {
    return _userLocalRepository.userStream;
  }
}
