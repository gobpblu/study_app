import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_app/core/common/models/bloc_status_enum.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthState(
          status: BlocStatusEnum.initial,
          username: '',
          isUsernameChanged: false,
        )) {
    on<UsernameChanged>(_onUsernameChanged);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<UpdateUsername>(_onUpdateUsername);
  }

  void _onUsernameChanged(
    UsernameChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
        status: BlocStatusEnum.success, username: event.username));
  }

  Future _onUpdateUsername(
    UpdateUsername event,
    Emitter<AuthState> emit,
  ) async {
    print('I work');
    await event.user?.updateDisplayName(state.username);
    emit(state.copyWith(
        status: BlocStatusEnum.success, isUsernameChanged: true));
  }

  Future _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
  }
}
