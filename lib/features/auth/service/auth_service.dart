import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/user/repository/user_local_repository.dart';
import 'package:study_app/features/user/repository/user_local_repository_impl.dart';

import '../../home/presentation/home_page.dart';
import '../bloc/auth_bloc.dart';
import '../presentation/display_name_page.dart';
import '../presentation/login_page.dart';

class AuthService {

  final UserLocalRepository userRepository = Get.put(UserLocalRepositoryImpl());

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