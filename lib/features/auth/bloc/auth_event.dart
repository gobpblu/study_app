part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsernameChanged extends AuthEvent {
  final String? username;

  UsernameChanged({required this.username});

  @override
  List<Object?> get props => [username];
}

class SignInWithGoogle extends AuthEvent {}

class UpdateUsername extends AuthEvent {
  final User? user;

  UpdateUsername({required this.user});

  @override
  List<Object?> get props => [user];
}