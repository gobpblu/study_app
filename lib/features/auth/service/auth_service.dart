import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/domain/repository/user_local_repository.dart';

import '../../home/presentation/home_page.dart';
import '../bloc/auth_bloc.dart';
import '../presentation/display_name_page.dart';
import '../presentation/login_page.dart';

class AuthService {

  final UserLocalRepository userRepository = getIt();

  Widget handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (buildContext, snapshot) {
          print('inside builder');
          if (snapshot.hasData) {
            print('I work');
            if (snapshot.data != null ) {
              userRepository.saveUser(snapshot.data!);
            }
            print(snapshot.data);
            if (snapshot.data?.displayName?.isEmpty ?? true) {
              return BlocProvider(
                create: (context) => AuthBloc(),
                child: DisplayNamePage(user: snapshot.data),
              );
            }
            return const HomePage();
          } else {
            return const LoginPage();
          }
        }
    );
  }

  signInWithGoogle() async {
    await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
  }
}