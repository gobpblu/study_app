import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:study_app/features/auth/domain/models/user.dart';

import '../../domain/repository/user_local_repository.dart';

class UserLocalRepositoryImpl extends UserLocalRepository {
  User? user;
  firebase.User? firebaseUser;

  final _controller = StreamController<User?>.broadcast();

  @override
  Stream<User?> get userStream => _controller.stream;

  @override
  User? getUser() => user;

  @override
  void saveUser(firebase.User user) {
    print('Current USER: $user');
    firebaseUser = user;
    this.user = User(uniqueId: user.uid, name: user.displayName ?? '');
    _addToStream(this.user);
  }

  void _addToStream(User? user) => _controller.sink.add(user);

  @override
  void logOut() {
    user = null;
    _addToStream(null);
  }

  @override
  firebase.User? getFirebaseUser() {
    return firebaseUser;
  }

}
