part of 'ratings_cubit.dart';

class RatingsState extends Equatable {
  const RatingsState({
    required this.usersRatings,
    required this.isLoading,
    required this.topic,
  });

  final List<UserRating> usersRatings;
  final bool isLoading;
  final String topic;

  RatingsState copyWith({
    List<UserRating>? usersRatings,
    bool? isLoading,
    String? topic,
  }) =>
      RatingsState(
        usersRatings: usersRatings ?? this.usersRatings,
        isLoading: isLoading ?? this.isLoading,
        topic: topic ?? this.topic,
      );

  @override
  List<Object?> get props => [usersRatings, isLoading, topic];
}
