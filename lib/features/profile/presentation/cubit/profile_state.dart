part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final User? user;

  const ProfileState({required this.user});

  ProfileState copyWith({
    User? user,
  }) {
    return ProfileState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
