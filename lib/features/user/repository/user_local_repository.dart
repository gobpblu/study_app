import 'package:firebase_auth/firebase_auth.dart';

abstract class UserLocalRepository {
  void saveUser(User user);
  User getUser();
}