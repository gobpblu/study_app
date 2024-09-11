part of 'ratings_cubit.dart';

class RatingsState extends Equatable {
  const RatingsState({
    required this.usersRatings,
    required this.isLoading,
  });

  final List<UserRating> usersRatings;
  final bool isLoading;

  RatingsState copyWith({
    List<UserRating>? usersRatings,
    bool? isLoading,
  }) =>
      RatingsState(
        usersRatings: usersRatings ?? this.usersRatings,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [usersRatings, isLoading];
}
