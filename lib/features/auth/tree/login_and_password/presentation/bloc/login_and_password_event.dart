part of 'login_and_password_bloc.dart';

abstract class LoginAndPasswordEvent extends Equatable {
  const LoginAndPasswordEvent();

  @override
  List<Object?> get props => [];
}

class SignInWithLoginAndPassword extends LoginAndPasswordEvent {}

class RegisterWithLoginAndPassword extends LoginAndPasswordEvent {}
