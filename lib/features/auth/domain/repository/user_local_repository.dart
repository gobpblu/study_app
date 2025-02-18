import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:study_app/features/auth/domain/models/user.dart';

abstract class UserLocalRepository {
  Stream<User?> get userStream;

  void saveUser(firebase.User user);
  User? getUser();
  firebase.User? getFirebaseUser();
  void logOut();
}