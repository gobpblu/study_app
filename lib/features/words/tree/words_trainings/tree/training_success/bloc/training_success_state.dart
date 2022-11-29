part of 'training_success_cubit.dart';

class TrainingSuccessState extends Equatable {
  const TrainingSuccessState({
    required this.points,
    required this.training,
    required this.words,
    required this.rightWords,
    required this.topic,
  });

  final int points;
  final String training;
  final List<WordWithPoints> words;
  final int rightWords;
  final String topic;

  TrainingSuccessState copyWith({
    int? points,
    String? training,
    List<WordWithPoints>? words,
    int? rightWords,
    String? topic,
  }) =>
      TrainingSuccessState(
        points: points ?? this.points,
        training: training ?? this.training,
        words: words ?? this.words,
        rightWords: rightWords ?? this.rightWords,
        topic: topic ?? this.topic,
      );

  @override
  List<Object?> get props => [points, training, words, rightWords, topic];
}
