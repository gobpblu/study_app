part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final BlocStatusEnum status;
  final String username;
  final bool isUsernameChanged;

  const AuthState({
    required this.isLoading,
    required this.status,
    required this.username,
    required this.isUsernameChanged,
  });

  AuthState copyWith({
    bool? isLoading,
    BlocStatusEnum? status,
    String? username,
    bool? isUsernameChanged,
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
        status: status ?? this.status,
        username: username ?? this.username,
        isUsernameChanged: isUsernameChanged ?? this.isUsernameChanged,
      );

  @override
  List<Object?> get props => [isLoading, status, username, isUsernameChanged];
}
