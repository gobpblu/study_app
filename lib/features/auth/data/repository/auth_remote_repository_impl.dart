import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_app/features/auth/data/service/auth_firebase_service.dart';
import 'package:study_app/features/auth/domain/repository/auth_remote_repository.dart';

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final AuthFirebaseService _authFirebaseService;

  AuthRemoteRepositoryImpl({
    required AuthFirebaseService authFirebaseService,
  }) : _authFirebaseService = authFirebaseService;

  @override
  Future logout() {
    return _authFirebaseService.logout();
  }

  @override
  Stream<User?> observeAuthState() {
    return _authFirebaseService.observeAuthState();
  }

  @override
  Stream<User?> observeUserChanges() {
    return _authFirebaseService.observeUserChanges();
  }


}
