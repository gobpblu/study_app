part of 'login_and_password_bloc.dart';

class LoginAndPasswordState extends Equatable {
  const LoginAndPasswordState({this.needPop = false});

  final bool needPop;

  LoginAndPasswordState copyWith({bool? needPop}) {
    return LoginAndPasswordState(
      needPop: needPop ?? this.needPop,
    );
  }

  @override
  List<Object?> get props => [needPop];
}
