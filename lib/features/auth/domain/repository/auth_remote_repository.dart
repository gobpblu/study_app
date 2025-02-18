import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteRepository {
  Future logout();

  Stream<User?> observeAuthState();

  Stream<User?> observeUserChanges();
}