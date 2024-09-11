import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:study_app/features/auth/domain/models/user.dart';

import '../../domain/repository/user_local_repository.dart';

class UserLocalRepositoryImpl extends UserLocalRepository {
  late User user;

  @override
  User getUser() => user;

  @override
  void saveUser(firebase.User user) {
    print('Current USER: $user');

    this.user = User(uniqueId: user.uid, name: user.displayName ?? '');
  }

}
