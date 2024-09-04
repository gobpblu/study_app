part of 'login_and_password_bloc.dart';

abstract class LoginAndPasswordState extends Equatable {
  const LoginAndPasswordState();
}

class LoginAndPasswordInitial extends LoginAndPasswordState {
  @override
  List<Object> get props => [];
}
