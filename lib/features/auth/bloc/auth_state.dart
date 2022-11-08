part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final BlocStatusEnum status;
  final String username;
  final bool isUsernameChanged;

  const AuthState({
    required this.status,
    required this.username,
    required this.isUsernameChanged,
  });

  AuthState copyWith({
    BlocStatusEnum? status,
    String? username,
    bool? isUsernameChanged,
  }) =>
      AuthState(
        status: status ?? this.status,
        username: username ?? this.username,
        isUsernameChanged: isUsernameChanged ?? this.isUsernameChanged,
      );

  @override
  List<Object?> get props => [status, username, isUsernameChanged];
}
