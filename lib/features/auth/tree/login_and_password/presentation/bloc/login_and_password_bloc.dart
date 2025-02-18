import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/generated/l10n.dart';

part 'login_and_password_event.dart';

part 'login_and_password_state.dart';

class LoginAndPasswordBloc extends Bloc<LoginAndPasswordEvent, LoginAndPasswordState> {
  LoginAndPasswordBloc() : super(const LoginAndPasswordState()) {
    on<SignInWithLoginAndPassword>(_onSignInWithLoginAndPassword);
    on<RegisterWithLoginAndPassword>(_onRegisterWithLoginAndPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future _onSignInWithLoginAndPassword(
    SignInWithLoginAndPassword event,
    Emitter<LoginAndPasswordState> emit,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(S.current.auth_error_user_not_found_title, S.current.auth_error_user_not_found_description);
      } else if (e.code == 'wrong-password') {
        Get.snackbar(S.current.auth_error_invalid_password_title, S.current.auth_error_invalid_password_description);
      } else if (e.code == 'invalid-email') {
        Get.snackbar(S.current.auth_error_invalid_email_title, S.current.auth_error_invalid_email_description);
      }
    }
  }

  Future _onRegisterWithLoginAndPassword(
    RegisterWithLoginAndPassword event,
    Emitter<LoginAndPasswordState> emit,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(state.copyWith(needPop: true));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(S.current.auth_error_user_not_found_title, S.current.auth_error_user_not_found_description);
      } else if (e.code == 'wrong-password') {
        Get.snackbar(S.current.auth_error_invalid_password_title, S.current.auth_error_invalid_password_description);
      } else if (e.code == 'invalid-email') {
        Get.snackbar(S.current.auth_error_invalid_email_title, S.current.auth_error_invalid_email_description);
      }
    }
  }
}
