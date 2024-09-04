import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/core/common/models/bloc_status_enum.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthState(
    isLoading: false,
    status: BlocStatusEnum.initial,
    username: '',
    isUsernameChanged: false,
    email: '',
    password: '',
  )) {
    on<UsernameChanged>(_onUsernameChanged);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<UpdateUsername>(_onUpdateUsername);
  }

  final db = Get.put(RealtimeDatabaseService());

  void _onUsernameChanged(UsernameChanged event,
      Emitter<AuthState> emit,) {
    emit(state.copyWith(
        status: BlocStatusEnum.success, username: event.username));
  }

  Future _onUpdateUsername(UpdateUsername event,
      Emitter<AuthState> emit,) async {
    emit(state.copyWith(isLoading: true));
    await event.user?.updateDisplayName(state.username);
    if (event.user != null) {
      final isCommitted = await db.saveUsernameByUid(state.username, event.user!.uid);
      if (isCommitted) {
        emit(state.copyWith(
            status: BlocStatusEnum.success, isUsernameChanged: true));
      }
    }

  }

  Future _onSignInWithGoogle(SignInWithGoogle event,
      Emitter<AuthState> emit,) async {
    // await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());

    final isSignedIn = await GoogleSignIn().isSignedIn();
    debugPrint('isSignedIn: ${isSignedIn}');

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    // debugPrint('googleUser: ${googleUser}');
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential.
    final OAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in to Firebase with the Google [UserCredential].
    final UserCredential googleUserCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);

    debugPrint('googleUserCredential: ${googleUserCredential.user}');


  }


}
