part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final BlocStatusEnum status;
  final String username;
  final bool isUsernameChanged;
  final String email;
  final String password;

  const AuthState({
    required this.isLoading,
    required this.status,
    required this.username,
    required this.isUsernameChanged,
    required this.email,
    required this.password,
  });

  AuthState copyWith({
    bool? isLoading,
    BlocStatusEnum? status,
    String? username,
    bool? isUsernameChanged,
    String? email,
    String? password,
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
        status: status ?? this.status,
        username: username ?? this.username,
        isUsernameChanged: isUsernameChanged ?? this.isUsernameChanged,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [
        isLoading,
        status,
        username,
        isUsernameChanged,
        email,
        password,
      ];
}
