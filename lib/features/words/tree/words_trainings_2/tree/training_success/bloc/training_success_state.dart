part of 'training_success_cubit.dart';

class TrainingSuccessState extends Equatable {
  const TrainingSuccessState({
    required this.points,
    required this.training,
    required this.words,
    required this.rightWords,
  });

  final int points;
  final String training;
  final List<WordWithPoints> words;
  final int rightWords;

  TrainingSuccessState copyWith({
    int? points,
    String? training,
    List<WordWithPoints>? words,
    int? rightWords,
  }) =>
      TrainingSuccessState(
        points: points ?? this.points,
        training: training ?? this.training,
        words: words ?? this.words,
        rightWords: rightWords ?? this.rightWords,
      );

  @override
  List<Object?> get props => [points, training, words, rightWords];
}
