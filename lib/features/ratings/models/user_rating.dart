import 'package:equatable/equatable.dart';

class UserRating extends Equatable {

  const UserRating({
    required this.username,
    required this.points,
});

  final String username;
  final int points;

  @override
  List<Object?> get props => [username, points];
}